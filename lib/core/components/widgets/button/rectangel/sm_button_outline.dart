part of '../../widgets.dart';

class SMButtonOutline extends StatelessWidget {
  final SMButtonStatusType statustype;
  final SMButtonSizeType sizeType;
  final String? text;
  final Function()? onPressed;
  final String? iconPath;
  final String? package;

  // PRIMARY
  const SMButtonOutline.primaryLarge({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.large;

  const SMButtonOutline.primaryMedium({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.medium;

  const SMButtonOutline.primarySmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.small;

  const SMButtonOutline.primaryXSmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.xSmall;

  // SECONDARY
  const SMButtonOutline.secondaryLarge({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.large;

  const SMButtonOutline.secondaryMedium({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.medium;

  const SMButtonOutline.secondarySmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.small;

  const SMButtonOutline.secondaryXSmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.xSmall;

  // DISABLE
  const SMButtonOutline.disableLarge({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.large;

  const SMButtonOutline.disableMedium({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.medium;

  const SMButtonOutline.disableSmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.small;

  const SMButtonOutline.disableXSmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.xSmall;

  @override
  Widget build(BuildContext context) {
    const double radius = SMRadius.size4;
    late EdgeInsetsGeometry padding;
    late TextStyle textStyle;
    Color? borderColor;
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
        padding = const EdgeInsets.symmetric(
                horizontal: SMDimens.size16, vertical: SMDimens.size12)
            .copyWith(right: (iconPath != null) ? SMDimens.size8 : null);
        textStyle = SMFontPoppins.actionMedium14;
        iconSize = SMDimens.size16;
        break;
      case SMButtonSizeType.small:
        padding = const EdgeInsets.symmetric(
                horizontal: SMDimens.size16, vertical: SMDimens.size8)
            .copyWith(right: (iconPath != null) ? SMDimens.size8 : null);
        textStyle = SMFontPoppins.actionMedium12;
        iconSize = SMDimens.size16;

        break;
      case SMButtonSizeType.xSmall:
        padding = const EdgeInsets.symmetric(
                horizontal: SMDimens.size8, vertical: SMDimens.size4)
            .copyWith(right: (iconPath != null) ? SMDimens.size4 : null);
        textStyle = SMFontPoppins.actionMedium10;
        iconSize = SMDimens.size12;
        break;
    }

    switch (statustype) {
      case SMButtonStatusType.primary:
        borderColor = SMColors.primary;
        foregroundColor = SMColors.primary;
        break;
      case SMButtonStatusType.secondary:
        borderColor = SMColors.secondary;
        foregroundColor = SMColors.secondary;
        break;
      default:
        borderColor = SMColors.naturalGrey50;
        foregroundColor = SMColors.naturalGrey50;
    }

    return _SMButtonMain.rectangel(
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: BorderSide(color: borderColor),
      ),
      foregroundColor: foregroundColor,
      backgroundColor: SMColors.transparent,
      onPressed: onPressed,
      text: text,
      textStyle: textStyle,
      iconPath: iconPath,
      iconSize: iconSize,
    );
  }
}
