import 'package:flutter/material.dart';
import 'package:gpt_flutter/commons/components/model/card_margin_model.dart';

class CardImageTextWidget extends StatelessWidget {
  final CardMarginModel marginModel;
  final double cardRadius;

  const CardImageTextWidget({
    super.key,
    required this.marginModel,
    required this.cardRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              cardRadius, //20 or 60
            ),
          ),
        ),
        margin: EdgeInsets.only(
          left: marginModel.left, //20 or 0
          right: marginModel.right, //0 or 20
          top: marginModel.top, //0
          bottom: marginModel.bottom, //32
        ),
        color: const Color(0x335C5C5C), //or 0xFF6750A4
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.start, //? MainAxisAlignment.end,
            children: [
              Image.asset('assets/images/open_ai_logo2.png'),
              Container(
                width: 8,
              ),
              const Expanded(
                child: Text(
                  'Algum texto esse é um teste para o tamanho do card, parece que não está aplicando margem direito',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}