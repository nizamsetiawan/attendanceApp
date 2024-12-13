part of 'widgets.dart';

class SMErrorWidget extends StatelessWidget {
  final String? message;
  final String? subMessage;
  final double? heightIcon;
  final TextStyle? style;
  final bool isNetworkError;
  final Function()? onTryAgain;

  const SMErrorWidget({
    super.key,
    this.message,
    this.subMessage,
    this.heightIcon = 180,
    this.style,
    this.onTryAgain,
  }) : isNetworkError = false;

  const SMErrorWidget.errorNetwork({
    super.key,
    this.message,
    this.subMessage,
    this.heightIcon = 180,
    this.style,
    this.onTryAgain,
  }) : isNetworkError = true;

  @override
  Widget build(BuildContext context) {
    late String message;
    String? subMessage;

    if (this.message != null) {
      message = this.message!;
    } else if (isNetworkError) {
      message = SMDisplayStrings.noInternet;
    } else {
      message = SMDisplayStrings.defaultMessageError;
    }

    if (this.subMessage != null) {
      subMessage = this.subMessage!;
    } else if (isNetworkError) {
      subMessage = SMDisplayStrings.pleaseConnetInternet;
    }
    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: SMDimens.size16),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  SMAssetPaths.errorLottie,
                  height: heightIcon,
                  fit: BoxFit.cover,
                ),
                Text(
                  message,
                  style: SMFontPoppins.smallcapsBold,
                ),
                const SizedBox(
                  height: 10,
                ),
                if (subMessage != null)
                  Text(
                    subMessage,
                    style: SMFontPoppins.smallcapsLight,
                  ),
                const SizedBox(
                  height: 20,
                ),
                if (onTryAgain != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SMDimens.size16,
                    ),
                    child: SMButtonFill.primaryMedium(
                      text: SMDisplayStrings.tryAgain,
                      onPressed: onTryAgain!,
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
