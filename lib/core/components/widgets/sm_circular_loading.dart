part of 'widgets.dart';

class SMCircularLoading extends StatelessWidget {
  final String? message;
  final bool isBasicLoading;
  const SMCircularLoading({
    super.key,
    this.message,
    this.isBasicLoading = true,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: (isBasicLoading)
          ? const CircularProgressIndicator()
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: SMColors.primary,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    child: Column(
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                         message ?? "Loading",
                         style: SMFontPoppins.display1Reguler,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
