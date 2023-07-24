import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavouriteCardWidget extends StatelessWidget{
  final String iconPath;
  final String text;
  final void Function()? onTap;

  const FavouriteCardWidget({super.key, required this.iconPath, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 86,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              spreadRadius: 0,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(iconPath,
              width: 28,
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(text,
                maxLines: 2,
                overflow: TextOverflow.fade,
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Color(0xFF222A34),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
