part of 'widgets.dart';

class SMCachedNetworkImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;

  const SMCachedNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url,
      placeholder: (context, url) {
        return FittedBox(
          fit:BoxFit.cover ,
          child: SMShimmer(
            height: height,
            width: width,
            borderRadius: borderRadius,
          ),
        );
      },
      errorWidget: (context, url, error) => SMErrorWidget(
        message: error.toString(),
      ),
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(SMRadius.size8),
            image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
