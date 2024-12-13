part of '../../widgets.dart';

class SMButtonCircularFill extends StatelessWidget {
  final SMButtonStatusType statustype;
  final SMButtonSizeType sizeType;
  final Function()? onPressed;
  final String? iconPath;
  final String? package;

  // PRIMARY
  const SMButtonCircularFill.primaryLarge({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.large;

  const SMButtonCircularFill.primaryMedium({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.medium;

  const SMButtonCircularFill.primarySmall({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.small;

  const SMButtonCircularFill.primaryXSmall({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.primary,
        sizeType = SMButtonSizeType.xSmall;

  // SECONDARY
  const SMButtonCircularFill.secondaryLarge({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.large;

  const SMButtonCircularFill.secondaryMedium({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.medium;

  const SMButtonCircularFill.secondarySmall({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.small;

  const SMButtonCircularFill.secondaryXSmall({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.secondary,
        sizeType = SMButtonSizeType.xSmall;

  // DISABLE
  const SMButtonCircularFill.disableLarge({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.large;

  const SMButtonCircularFill.disableMedium({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.medium;

  const SMButtonCircularFill.disableSmall({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.small;

  const SMButtonCircularFill.disableXSmall({
    super.key,
    this.iconPath,
    this.onPressed,
    this.package,
  })  : statustype = SMButtonStatusType.disable,
        sizeType = SMButtonSizeType.xSmall;

  @override
  Widget build(BuildContext context) {
    late EdgeInsetsGeometry padding;
    Color? backgroundColor;
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
        padding = const EdgeInsets.all(SMDimens.size10);
        iconSize = SMDimens.size20;
        break;
      case SMButtonSizeType.xSmall:
        padding = const EdgeInsets.all(SMDimens.size8);
        iconSize = SMDimens.size20;
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

    return _SMButtonMain.circular(
      padding: padding,
      shape: const CircleBorder(),
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      onPressed: onPressed,
      iconPath: iconPath,
      iconSize: iconSize,
    );
  }
}
