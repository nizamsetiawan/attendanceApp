part of '../../widgets.dart';

class SMButtonFill extends StatelessWidget {
  final SMButtonStatusType statustype;
  final SMButtonSizeType sizeType;
  final String? text;
  final Function()? onPressed;
  final String? iconPath;
  final String? package;
  final BorderRadiusGeometry? borderRadius;

  // PRIMARY
  const SMButtonFill.primaryLarge({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
    this.borderRadius,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.large;

  const SMButtonFill.primaryMedium({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
    this.borderRadius,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.medium;

  const SMButtonFill.primarySmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
    this.borderRadius,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.small;

  const SMButtonFill.primaryXSmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
    this.borderRadius,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.xSmall;

  // SECONDARY
  const SMButtonFill.secondaryLarge({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
    this.borderRadius,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.large;

  const SMButtonFill.secondaryMedium({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
    this.borderRadius,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.medium;

  const SMButtonFill.secondarySmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
    this.borderRadius,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.small;

  const SMButtonFill.secondaryXSmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
    this.borderRadius,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.xSmall;

  // DISABLE
  const SMButtonFill.disableLarge({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
    this.borderRadius,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.large;

  const SMButtonFill.disableMedium({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
    this.borderRadius,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.medium;

  const SMButtonFill.disableSmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
    this.borderRadius,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.small;

  const SMButtonFill.disableXSmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
    this.borderRadius,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.xSmall;

  @override
  Widget build(BuildContext context) {
    const double radius = SMRadius.size4;
    late EdgeInsetsGeometry padding;
    late TextStyle textStyle;
    Color? backgroundColor;
    Color? foregroundColor;
    double? iconSize;

    /// SET Padding & TextStyle
    switch (sizeType) {
      case SMButtonSizeType.large:
        padding = const EdgeInsets.all(SMDimens.size16)
            .copyWith(right: (iconPath != null) ? SMDimens.size8 : null);
        textStyle = SMFontPoppins.header5Medium;
        iconSize = SMDimens.size20;
        break;
      case SMButtonSizeType.medium:
        padding = const EdgeInsets.symmetric(horizontal: SMDimens.size16, vertical: SMDimens.size12)
            .copyWith(right: (iconPath != null) ? SMDimens.size8 : null);
        textStyle = SMFontPoppins.actionMedium14;
        iconSize = SMDimens.size16;
        break;
      case SMButtonSizeType.small:
        padding = const EdgeInsets.symmetric(horizontal: SMDimens.size16, vertical: SMDimens.size8)
            .copyWith(right: (iconPath != null) ? SMDimens.size8 : null);
        textStyle = SMFontPoppins.actionMedium12;
        iconSize = SMDimens.size16;

        break;
      case SMButtonSizeType.xSmall:
        padding = const EdgeInsets.symmetric(horizontal: SMDimens.size8, vertical: SMDimens.size4)
            .copyWith(right: (iconPath != null) ? SMDimens.size4 : null);
        textStyle = SMFontPoppins.actionMedium10;
        iconSize = SMDimens.size12;
        break;
    }

    switch (statustype) {
      case SMButtonStatusType.primary:
        backgroundColor = SMColors.primary;
        foregroundColor = SMColors.white;
        break;
      case SMButtonStatusType.secondary:
        backgroundColor = SMColors.secondary;
        foregroundColor = SMColors.white;
        break;
      default:
        backgroundColor = SMColors.naturalGrey50;
        foregroundColor = SMColors.naturalGrey20;
    }

    return _SMButtonMain.rectangel(
      padding: padding,
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(radius)),
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      onPressed: onPressed,
      text: text,
      textStyle: textStyle,
      iconPath: iconPath,
      iconSize: iconSize,
    );
  }
}
