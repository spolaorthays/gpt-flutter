import 'package:flutter/material.dart';

class CardTextWidget extends StatelessWidget {
  final String cardText;
  final Color cardColor;
  final double borderRadius;

  const CardTextWidget({
    super.key,
    required this.cardText,
    required this.cardColor,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Card(
        margin: const EdgeInsets.only(
          left: 20,
          top: 16,
          right: 20,
          bottom: 16,
        ),
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
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
