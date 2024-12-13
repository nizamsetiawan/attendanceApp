part of 'widgets.dart';

class SMToastBar extends StatelessWidget {
  final String message;
  final Function()? onClose;
  final SMToastbarType type;
  final EdgeInsetsGeometry? margin;
  const SMToastBar({
    super.key,
    required this.message,
    this.onClose,
    this.margin,
  }) : type = SMToastbarType.none;

  const SMToastBar.info({
    super.key,
    required this.message,
    this.onClose,
    this.margin,
  }) : type = SMToastbarType.info;

  const SMToastBar.error({
    super.key,
    required this.message,
    this.onClose,
    this.margin,
  }) : type = SMToastbarType.error;

  const SMToastBar.warning({
    super.key,
    required this.message,
    this.onClose,
    this.margin,
  }) : type = SMToastbarType.warning;

  const SMToastBar.success({
    super.key,
    required this.message,
    this.onClose,
    this.margin,
  }) : type = SMToastbarType.success;

  @override
  Widget build(BuildContext context) {
    late Color backgroundColor;
    late Color iconColor;
    late Color textColor;
    Color? borderColor;

    switch (type) {
      case SMToastbarType.info:
        backgroundColor = SMColors.stateInfoFill;
        iconColor = SMColors.stateInfoBase;
        textColor = SMColors.stateInfoBase;
        borderColor = SMColors.stateInfoStroke;
        break;
      case SMToastbarType.error:
        backgroundColor = SMColors.stateErrorFill;
        iconColor = SMColors.stateErrorBase;
        textColor = SMColors.stateErrorBase;
        borderColor = SMColors.stateErrorStroke;
        break;
      case SMToastbarType.warning:
        backgroundColor = SMColors.stateWarningFill;
        iconColor = SMColors.stateWarningBase;
        textColor = SMColors.stateWarningBase;
        borderColor = SMColors.stateWarningStroke;

        break;
      case SMToastbarType.success:
        backgroundColor = SMColors.stateSuccessFill;
        iconColor = SMColors.stateSuccessBase;
        textColor = SMColors.stateSuccessBase;
        borderColor = SMColors.stateSuccessStroke;
        break;
      default:
        backgroundColor = SMColors.naturalGrey10;
        iconColor = SMColors.naturalGrey70;
        textColor = SMColors.naturalGrey100;
    }
    return Container(
      width: double.infinity,
      margin: margin,
      padding: const EdgeInsets.symmetric(
          horizontal: SMDimens.size12, vertical: SMDimens.size10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SMRadius.size12),
        border: (borderColor != null) ? Border.all(color: borderColor) : null,
        color: backgroundColor,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: SMDimens.size8),
            child: SmSvgPicture.asset(
              height: SMDimens.size20,
              width: SMDimens.size20,
              fit: BoxFit.cover,
              value: SMAssetPaths.errorIcon,
              color: iconColor,
            ),
          ),
          Expanded(
            child: Text(
              message,
              style: SMFontPoppins.actionMedium12.copyWith(color: textColor),
            ),
          ),
          if (onClose != null)
            Padding(
              padding: const EdgeInsets.only(left: SMDimens.size8),
              child: GestureDetector(
                onTap: onClose,
                child: SmSvgPicture.asset(
                  height: SMDimens.size20,
                  width: SMDimens.size20,
                  fit: BoxFit.cover,
                  value: SMAssetPaths.cancelIcon,
                  color: iconColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
