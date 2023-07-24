import 'package:flutter/material.dart';

class NewsCardWidget extends StatelessWidget{
  final String imageUrl;
  final String text;

  const NewsCardWidget({super.key, required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Text(text,
          style: const TextStyle(color: Colors.white,),
        ),
      ),
    );
  }
}
