part of '../widgets.dart';

class SMInputField extends StatelessWidget {
  final String? label;
  final String? textHint;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool isRequired;
  final int maxLines;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Function()? onTapSuffix;
  final Function(String value)? onChange;
  final bool? obscureText;
  final bool isEnable;
  final String? Function(String?)? validator;
  final bool isError;
  final bool isShowErrorMessage;
  final String? desc;

  const SMInputField({
    super.key,
    this.label,
    this.textHint,
    this.controller,
    this.focusNode,
    this.margin,
    this.autofocus = false,
    this.isRequired = false,
    this.onChange,
    this.maxLines = 1,
    this.prefixIconPath,
    this.suffixIconPath,
    this.prefixWidget,
    this.suffixWidget,
    this.onTapSuffix,
    this.obscureText,
    this.isEnable = true,
    this.validator,
    this.isError = false,
    this.isShowErrorMessage = true,
    this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InputFieldInteractorCubit(),
      child: _SMInputField(
        label: label,
        textHint: textHint,
        controller: controller,
        focusNode: focusNode,
        margin: margin,
        autofocus: autofocus,
        isRequired: isRequired,
        maxLines: maxLines,
        onChange: onChange,
        prefixIconPath: prefixIconPath,
        onTapSuffix: onTapSuffix,
        suffixIconPath: suffixIconPath,
        prefixWidget: prefixWidget,
        suffixWidget: suffixWidget,
        obscureText: obscureText,
        isEnable: isEnable,
        validator: validator,
        isError: isError,
        isShowErrorMessage: isShowErrorMessage,
        desc: desc,
      ),
    );
  }
}

class _SMInputField extends StatefulWidget {
  final String? label;
  final String? textHint;
  final int maxLines;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool isRequired;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Function()? onTapSuffix;
  final Function(String value)? onChange;
  final bool? obscureText;
  final bool isEnable;
  final String? Function(String?)? validator;
  final bool isError;
  final bool isShowErrorMessage;
  final String? desc;

  const _SMInputField({
    required this.label,
    required this.textHint,
    required this.maxLines,
    required this.controller,
    required this.focusNode,
    required this.margin,
    required this.autofocus,
    required this.isRequired,
    required this.onChange,
    required this.prefixIconPath,
    required this.suffixIconPath,
    required this.prefixWidget,
    required this.suffixWidget,
    required this.onTapSuffix,
    required this.obscureText,
    required this.isEnable,
    required this.validator,
    required this.isError,
    required this.isShowErrorMessage,
    required this.desc,
  });

  @override
  State<_SMInputField> createState() => __SMInputFieldState();
}

class __SMInputFieldState extends State<_SMInputField> {
  late FocusNode focusNode;
  late TextEditingController controller;
  late String initialValue;
  @override
  void initState() {
    context.read<InputFieldInteractorCubit>().initital(
          hasFocus: widget.autofocus,
          isTextEmpty: (widget.controller != null)
              ? widget.controller!.text.isEmpty
              : true,
          obscureText: widget.obscureText,
        );

    controller = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode();
    initialValue = controller.text;

    focusNode.addListener(
      () {
        context
            .read<InputFieldInteractorCubit>()
            .changeFocusNodeStatus(focusNode.hasFocus);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      focusNode.dispose();
    }
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 4),
              child: RichText(
                text: TextSpan(
                  text: widget.label,
                  style: SMFontPoppins.actionMedium14
                      .copyWith(color: SMColors.naturalGrey80),
                  children: [
                    if (widget.isRequired)
                      TextSpan(
                        text: "*",
                        style: SMFontPoppins.actionMedium12
                            .copyWith(color: SMColors.stateErrorBase),
                      )
                  ],
                ),
              ),
            ),
          BlocBuilder<InputFieldInteractorCubit, InputFieldInteractorState>(
            builder: (context, state) {
              String? Function(String?)? validator;
              late Color borderColor;

              if (widget.validator != null) {
                validator = widget.validator;
              } else if (widget.isRequired) {
                validator = (value) => (value == null || value.trim().isEmpty)
                    ? SMDisplayStrings.canNotEmpty
                    : null;
              }

              if (state.hasFocus) {
                borderColor = SMColors.naturalGrey80;
              } else if (widget.isError) {
                borderColor = SMColors.stateErrorBase;
              } else {
                borderColor = SMColors.naturalGrey50;
              }
              if (validator != null) {
                return FormField<String>(
                  enabled: widget.isEnable,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: widget.controller?.text,
                  validator: validator,
                  builder: (validationState) {
                    bool isError = !(validationState.errorText == null ||
                        validationState.isValid);

                    if (isError) {
                      borderColor = SMColors.stateErrorBase;
                    }

                    return _FullTextFieldWidget(
                      widget: widget,
                      borderColor: borderColor,
                      controller: controller,
                      focusNode: focusNode,
                      errorText: validationState.errorText,
                      hasError: validationState.hasError,
                      hasFocus: state.hasFocus,
                      isTextEmpty: state.isTextEmpty,
                      obscureText: state.obscureText,
                      isShowErrorMessage:widget.isShowErrorMessage,
                      onChanged: (value) {
                        widget.onChange?.call(value);
                        validationState.didChange(value);
                      },
                      onClear: () {
                        validationState.didChange(null);
                      },
                    );
                  },
                );
              } else {
                return _FullTextFieldWidget(
                  widget: widget,
                  borderColor: borderColor,
                  controller: controller,
                  focusNode: focusNode,
                  hasFocus: state.hasFocus,
                  isTextEmpty: state.isTextEmpty,
                  obscureText: state.obscureText,
                  onChanged: widget.onChange,
                  isShowErrorMessage:widget.isShowErrorMessage,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _FullTextFieldWidget extends StatelessWidget {
  const _FullTextFieldWidget({
    required this.widget,
    required this.borderColor,
    required this.controller,
    required this.focusNode,
    required this.hasFocus,
    required this.obscureText,
    required this.onChanged,
    required this.isTextEmpty,
    required this.isShowErrorMessage,
    this.onClear,
    this.errorText,
    this.hasError = false,
  });

  final _SMInputField widget;
  final Color borderColor;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool hasFocus;
  final bool? obscureText;
  final bool isTextEmpty;
  final bool hasError;
  final String? errorText;
  final bool isShowErrorMessage;
  final Function(String value)? onChanged;
  final Function()? onClear;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: (!widget.isEnable) ? SMColors.naturalGrey30 : null,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PrefixWidget(
                prefixIconPath: widget.prefixIconPath,
                maxLines: widget.maxLines,
                hasFocus: hasFocus,
                prefixWidget: widget.prefixWidget,
                borderColor: borderColor,
              ),
              Expanded(
                child: _TextFieldWidget(
                  controller: controller,
                  focusNode: focusNode,
                  obscureText: obscureText,
                  autofocus: widget.autofocus,
                  isEnable: widget.isEnable,
                  maxLines: widget.maxLines,
                  prefixIconPath: widget.prefixIconPath,
                  textHint: widget.textHint,
                  onChanged: (value) {
                    context
                        .read<InputFieldInteractorCubit>()
                        .changeTextStatus(value.isEmpty);
                    onChanged?.call(value);
                  },
                ),
              ),
              _SuffixWidget(
                widget: widget,
                controller: controller,
                obscureText: obscureText,
                isTextEmpty: isTextEmpty,
                onClear: () {
                  controller.clear();
                  onClear?.call();
                  context
                      .read<InputFieldInteractorCubit>()
                      .changeTextStatus(true);
                },
              ),
            ],
          ),
        ),

        ///Desc
        Builder(
          builder: (context) {
            String? text;
            Color? color;
            if (hasError && errorText != null && isShowErrorMessage) {
              text = errorText;
              color = SMColors.stateErrorBase;
            } else if (widget.desc != null) {
              text = widget.desc;
              color = SMColors.naturalGrey70;
            }
            if (text != null) {
              return Padding(
                padding: const EdgeInsets.only(left: 12, top: 2),
                child: Text(
                  text,
                  style: SMFontPoppins.actionMedium10.copyWith(
                    color: color,
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}

class _SuffixWidget extends StatelessWidget {
  const _SuffixWidget({
    required this.widget,
    required this.obscureText,
    required this.isTextEmpty,
    required this.controller,
    required this.onClear,
  });

  final _SMInputField widget;
  final bool? obscureText;
  final bool isTextEmpty;
  final TextEditingController controller;
  final Function() onClear;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.suffixWidget != null) {
          return widget.suffixWidget!;
        }
        if (obscureText != null) {
          return _IconFromAssetWidget(
            onTap: () {
              context
                  .read<InputFieldInteractorCubit>()
                  .changeObscureTextStatus(!obscureText!);
            },
            suffixIconPath:
                (obscureText!) ? SMAssetPaths.eyeOn : SMAssetPaths.eyeOff,
          );
        }

        late Function() onTap;
        String suffixIconPath =
            widget.suffixIconPath ?? SMAssetPaths.cancelIcon;

        if (widget.onTapSuffix != null) {
          onTap = widget.onTapSuffix!;
        } else {
          onTap = onClear;
        }

        if (!isTextEmpty || widget.suffixIconPath != null) {
          return _IconFromAssetWidget(
            onTap: onTap,
            suffixIconPath: suffixIconPath,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _TextFieldWidget extends StatelessWidget {
  const _TextFieldWidget({
    required this.controller,
    required this.focusNode,
    required this.obscureText,
    required this.isEnable,
    required this.autofocus,
    required this.maxLines,
    required this.textHint,
    required this.prefixIconPath,
    required this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool? obscureText;
  final bool isEnable;
  final bool autofocus;
  final int maxLines;
  final String? textHint;
  final String? prefixIconPath;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        obscureText: (obscureText != null) ? obscureText! : false,
        obscuringCharacter: "*",
        enabled: isEnable,
        autofocus: autofocus,
        style: SMFontPoppins.paragraph1Reguler
            .copyWith(color: SMColors.naturalGrey60),
        maxLines: maxLines,
        keyboardType: TextInputType.multiline,
        onChanged: onChanged,
        decoration: InputDecoration(
          isDense: true,
          fillColor: SMColors.transparent,
          hintText: textHint,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ).copyWith(
            left: (prefixIconPath != null) ? 4 : 12,
          ),
          constraints: const BoxConstraints(
            minHeight: 0,
          ),
          hintStyle: SMFontPoppins.paragraph1Reguler
              .copyWith(color: SMColors.naturalGrey50),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class _PrefixWidget extends StatelessWidget {
  const _PrefixWidget({
    required this.prefixIconPath,
    required this.maxLines,
    required this.hasFocus,
    required this.prefixWidget,
    required this.borderColor,
  });

  final String? prefixIconPath;
  final int maxLines;
  final bool hasFocus;
  final Widget? prefixWidget;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (prefixIconPath != null) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(SMRadius.size4),
                bottomLeft: Radius.circular(SMRadius.size4),
              ),
              border: (maxLines > 1)
                  ? null
                  : Border(
                      right: BorderSide(
                        color: borderColor,
                      ),
                    ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(SMRadius.size12).copyWith(
                right: (maxLines > 1) ? SMDimens.size4 : null,
              ),
              child: const SmSvgPicture.asset(
                height: 20,
                width: 20,
                fit: BoxFit.cover,
                value: SMAssetPaths.callIcon,
              ),
            ),
          );
        } else if (prefixWidget != null) {
          return prefixWidget!;
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _IconFromAssetWidget extends StatelessWidget {
  const _IconFromAssetWidget({
    required this.onTap,
    required this.suffixIconPath,
  });

  final Function() onTap;
  final String suffixIconPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(SMRadius.size12).copyWith(left: 0),
        child: SmSvgPicture.asset(
          height: 20,
          width: 20,
          fit: BoxFit.cover,
          value: suffixIconPath,
        ),
      ),
    );
  }
}
