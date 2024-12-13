part of '../../widgets.dart';

class SMButtonCircularOutline extends StatelessWidget {
  final SMButtonStatusType statustype;
  final SMButtonSizeType sizeType;
  final Function()? onPressed;
  final String? iconPath;
  final String? package;

  // PRIMARY
  const SMButtonCircularOutline.primaryLarge({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.large;

  const SMButtonCircularOutline.primaryMedium({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.medium;

  const SMButtonCircularOutline.primarySmall({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.small;

  const SMButtonCircularOutline.primaryXSmall({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.xSmall;

  // SECONDARY
  const SMButtonCircularOutline.secondaryLarge({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.large;

  const SMButtonCircularOutline.secondaryMedium({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.medium;

  const SMButtonCircularOutline.secondarySmall({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.small;

  const SMButtonCircularOutline.secondaryXSmall({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.xSmall;

  // DISABLE
  const SMButtonCircularOutline.disableLarge({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.large;

  const SMButtonCircularOutline.disableMedium({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.medium;

  const SMButtonCircularOutline.disableSmall({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.small;

  const SMButtonCircularOutline.disableXSmall({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.xSmall;

  @override
  Widget build(BuildContext context) {
    late EdgeInsetsGeometry padding;
    Color? foregroundColor;
    double? iconSize;

    /// SET Padding & TextStyle
    switch (sizeType) {
      case SMButtonSizeType.large:
        padding = const EdgeInsets.all(SMDimens.size12);
        iconSize = SMDimens.size32;
        break;
      case SMButtonSizeType.medium:
        padding = const EdgeInsets.all(SMDimens.size12);
        iconSize = SMDimens.size24;
        break;
      case SMButtonSizeType.small:
        padding = const EdgeInsets.all(10);
        iconSize = SMDimens.size20;
        break;
      case SMButtonSizeType.xSmall:
        padding = const EdgeInsets.all(6);
        iconSize = SMDimens.size20;
        break;
    }

    switch (statustype) {
      case SMButtonStatusType.primary:
        foregroundColor = SMColors.primary;
        break;
      case SMButtonStatusType.secondary:
        foregroundColor = SMColors.secondary100;
        break;
      default:
        foregroundColor = SMColors.naturalGrey50;
    }

    return _SMButtonMain.circular(
      padding: padding,
      shape: CircleBorder(side: BorderSide(color: foregroundColor)),
      foregroundColor: foregroundColor,
      backgroundColor: SMColors.transparent,
      onPressed: onPressed,
      iconPath: iconPath,
      iconSize: iconSize,
    );
  }
}
