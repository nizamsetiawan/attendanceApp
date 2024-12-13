part of '../widgets.dart';

class _SMButtonMain extends StatelessWidget {
  const _SMButtonMain.rectangel({
    required this.padding,
    required this.shape,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.onPressed,
    required this.text,
    required this.textStyle,
    required this.iconPath,
    required this.iconSize,
  }) : buttonShape = SMButtonShapeType.rectangel;

  const _SMButtonMain.circular({
    required this.padding,
    required this.shape,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.onPressed,
    required this.iconPath,
    required this.iconSize,
  })  : buttonShape = SMButtonShapeType.circular,
        text = null,
        textStyle = null;

  final EdgeInsetsGeometry padding;
  final OutlinedBorder? shape;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Function()? onPressed;
  final String? text;
  final TextStyle? textStyle;
  final String? iconPath;
  final double? iconSize;
  final SMButtonShapeType buttonShape;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        elevation: 0,
        shape: shape,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap
      ),
      onPressed: onPressed,
      child: (buttonShape == SMButtonShapeType.rectangel)
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (text != null)
                  Text(
                    text!,
                    style: textStyle,
                  ),
                if (iconPath != null)
                  Padding(
                    padding: const EdgeInsets.only(left: SMDimens.size4),
                    child: SmSvgPicture.asset(
                      value: iconPath!,
                      height: iconSize,
                      width: iconSize,
                      fit: BoxFit.cover,
                      color: foregroundColor,
                    ),
                  ),
              ],
            )
          : SmSvgPicture.asset(
              value: iconPath!,
              height: iconSize,
              width: iconSize,
              fit: BoxFit.cover,
              color: foregroundColor,
            ),
    );
  }
}
