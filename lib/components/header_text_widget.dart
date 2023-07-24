import 'package:flutter/cupertino.dart';

class HeaderTextWidget extends StatelessWidget {
  final String text;

  const HeaderTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF8A898E),
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 1,
      ),
    );
  }
}
