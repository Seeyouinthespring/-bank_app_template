import 'package:flutter/cupertino.dart';

class SumLabelWidget extends StatelessWidget{


  final String mainTitle;
  final String alterTitle;

  const SumLabelWidget({super.key, required this.mainTitle, required this.alterTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          mainTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xFF00A3FF),
          ),
        ),
        Text(
          alterTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xFF8A898E),
          ),
        )
      ],
    );
  }
}
