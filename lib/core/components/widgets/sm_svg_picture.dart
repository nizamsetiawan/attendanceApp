part of 'widgets.dart';

class SmSvgPicture extends StatelessWidget {
  final String value;
  final SMSvgPictureSource source;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;

  const SmSvgPicture.asset({
    required this.value,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
    super.key,
  }) : source = SMSvgPictureSource.asset;

  const SmSvgPicture.network({
    required this.value,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
    super.key,
  }) : source = SMSvgPictureSource.network;

  @override
  Widget build(BuildContext context) {
    switch (source) {
      case SMSvgPictureSource.asset:
        return SvgPicture.asset(
          value,
          width: width,
          height: height,
          fit: fit,
          colorFilter: (color != null)
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : null,
        );
      default:
        return SvgPicture.network(
          value,
          width: width,
          height: height,
          fit: fit,
          colorFilter: (color != null)
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : null,
        );
    }
  }
}

