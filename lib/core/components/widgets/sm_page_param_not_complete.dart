part of 'widgets.dart';

class SMParamNotComplete extends StatelessWidget {
  const SMParamNotComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(SMDisplayStrings.paramsNotComplete),        
      ),
    );
  }
}
