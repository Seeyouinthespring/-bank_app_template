import 'package:flutter/material.dart';

class LinearGradientIconButtonWidget extends StatelessWidget{
  final IconData iconData;
  final Function()? onPressed;

  const LinearGradientIconButtonWidget({super.key, required this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24),
      height: 38,
      width: 38,
      decoration: BoxDecoration(
        borderRadius:
        const BorderRadius.all(Radius.circular(19)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bounds) =>
              const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF02A1FB),
                  Color(0xFF0268C6),
                ],
              ).createShader(bounds),
          child: Icon(
            iconData,
            size: 18,
          ),
        ),
      ),
    );
  }
}
