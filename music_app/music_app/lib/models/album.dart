import 'package:flutter/material.dart';

class Album extends StatelessWidget {
  final String imageUrl;

  const Album({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16, bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imageUrl,
          height: 220,
          width: 140,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Album1 extends StatelessWidget {
  final String imagePath;

  const Album1({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  @override
Widget build(BuildContext context) {
  return Container(
    width: 250,
    margin: const EdgeInsets.only(right: 16, bottom: 16),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        height: 200,
        width: 250,
        fit: BoxFit.cover,
      ),
    ),
  );
}
}
