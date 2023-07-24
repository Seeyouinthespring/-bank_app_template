import 'package:flutter/cupertino.dart';

class LinearGradientDecorationWidget extends StatelessWidget{
  final Widget childWidget;

  const LinearGradientDecorationWidget({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:[
            Color(0xFF02A1FB),
            Color(0xFF0268C6),
          ],
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: childWidget
    );
  }
}
