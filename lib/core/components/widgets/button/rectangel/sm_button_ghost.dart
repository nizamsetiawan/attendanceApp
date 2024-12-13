part of '../../widgets.dart';

class SMButtonGhost extends StatelessWidget {
  final SMButtonStatusType statustype;
  final SMButtonSizeType sizeType;
  final String? text;
  final Function()? onPressed;
  final String? iconPath;
  final String? package;

  // PRIMARY
  const SMButtonGhost.primaryLarge({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.large;

  const SMButtonGhost.primaryMedium({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.medium;

  const SMButtonGhost.primarySmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.small;

  const SMButtonGhost.primaryXSmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.xSmall;

  // SECONDARY
  const SMButtonGhost.secondaryLarge({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.large;

  const SMButtonGhost.secondaryMedium({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.medium;

  const SMButtonGhost.secondarySmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.small;

  const SMButtonGhost.secondaryXSmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.xSmall;

  // DISABLE
  const SMButtonGhost.disableLarge({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.large;

  const SMButtonGhost.disableMedium({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.medium;

  const SMButtonGhost.disableSmall({
    super.key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.small;

  const SMButtonGhost.disableXSmall({
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
    Color? foregroundColor;
    double? iconSize;

    /// SET Padding & TextStyle
    switch (sizeType) {
      case SMButtonSizeType.large:
        padding = const EdgeInsets.all(16)
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
        foregroundColor = SMColors.primary;
        break;
      case SMButtonStatusType.secondary:
        foregroundColor = SMColors.secondary;
        break;
      default:
        foregroundColor = SMColors.naturalGrey50;
    }

    return _SMButtonMain.rectangel(
      padding: padding,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
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
