import 'package:flutter/material.dart';
import 'package:gpt_flutter/commons/components/model/card_margin_model.dart';

class CardImageTextModel {
  final CardMarginModel marginModel;
  final Color color;
  final bool shouldShowImage;
  final double radius;

  CardImageTextModel({
    required this.marginModel,
    required this.color,
    required this.shouldShowImage,
    required this.radius,
  });
}
