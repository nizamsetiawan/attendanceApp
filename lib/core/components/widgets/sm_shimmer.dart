part of 'widgets.dart';

class SMShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;

  const SMShimmer({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: SMColors.naturalGrey20,
      highlightColor: SMColors.naturalGrey10,
      enabled: true,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.all(SMDimens.size16),
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(SMRadius.size8),
          color: SMColors.white,
        ),
      ),
    );
  }
}
