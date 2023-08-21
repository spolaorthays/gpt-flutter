import 'package:flutter/material.dart';
import 'package:gpt_flutter/commons/components/model/card_text_model.dart';

class CardTextWidget extends StatelessWidget {
  final String cardText;
  final CardTextModel rgboColors;

  const CardTextWidget(
      {super.key, required this.cardText, required this.rgboColors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.only(
          left: 20,
          top: 16,
          right: 20,
          bottom: 16,
        ),
        color: Color.fromRGBO(
          rgboColors.r,
          rgboColors.g,
          rgboColors.b,
          rgboColors.opacity,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            top: 12,
            right: 24,
            bottom: 12,
          ),
          child: Text(
            cardText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
    );
  }
}
