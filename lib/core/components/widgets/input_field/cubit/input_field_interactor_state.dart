part of 'input_field_interactor_cubit.dart';

class InputFieldInteractorState {
  final bool hasFocus;
  final bool isTextEmpty;
  final bool? obscureText;
  InputFieldInteractorState({
    this.hasFocus = false,
    this.isTextEmpty = true,
    this.obscureText,
  });

  InputFieldInteractorState copyWith({
    bool? hasFocus,
    bool? isTextEmpty,
    bool? obscureText,
  }) {
    return InputFieldInteractorState(
      hasFocus: hasFocus ?? this.hasFocus,
      isTextEmpty: isTextEmpty ?? this.isTextEmpty,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
