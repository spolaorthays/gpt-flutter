import 'package:flutter/material.dart';

import '../model/card_text_model.dart';
import 'card_text_widget.dart';
import 'image_text_widget.dart';

class PageElementWidget extends StatelessWidget {
  final String imagePath;
  final String imageText;
  final List<String> cardText;
  final CardTextModel cardColor;

  const PageElementWidget({
    super.key,
    required this.imagePath,
    required this.imageText,
    required this.cardText,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ImageTextWidget(
          imagePath: imagePath,
          imageText: imageText,
        ),
        Column(
          children: List.generate(
            cardText.length,
            (index) {
              return CardTextWidget(
                cardText: cardText.elementAt(index),
                rgboColors: cardColor,
              );
            },
          ),
        ),
      ],
    );
  }
}
