part of 'widgets.dart';

class SMDataNotFound extends StatelessWidget {
  final String? message;
  final String? subMessage;
  final double? heightIcon;
  final TextStyle? style;

  const SMDataNotFound(
      {super.key,
      this.message,
      this.subMessage,
      this.heightIcon = 180,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  SMAssetPaths.emptyLottie,
                  height: heightIcon,
                  fit: BoxFit.cover,
                ),
                Text(
                message ?? SMDisplayStrings.dataNotFound,
                ),
                if (subMessage != null)
                  Text(
                   subMessage!,
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
