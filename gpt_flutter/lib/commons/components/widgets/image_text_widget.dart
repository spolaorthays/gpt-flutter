import 'package:flutter/material.dart';

class ImageTextWidget extends StatelessWidget {
  final String imagePath;
  final String imageText;

  const ImageTextWidget(
      {super.key, required this.imagePath, required this.imageText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 60, bottom: 40),
        child: Column(
          children: [
            Image.asset(imagePath),
            Text(
              imageText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
