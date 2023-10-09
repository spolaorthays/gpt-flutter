import 'package:flutter/material.dart';
import 'package:gpt_flutter/commons/components/model/card_image_text_model.dart';
import 'package:gpt_flutter/commons/components/model/card_margin_model.dart';
import 'package:gpt_flutter/commons/strings/chat_strings.dart';
import 'package:gpt_flutter/commons/strings/image_path_strings.dart';

class CardImageTextWidget extends StatelessWidget {
  const CardImageTextWidget({
    super.key,
    required this.role,
    required this.message,
  });

  final String message;
  final String role;

  @override
  Widget build(BuildContext context) {
    final CardImageTextModel cardConfigs = defineCardConfigsByRole(role);

    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              cardConfigs.radius,
            ),
          ),
        ),
        margin: EdgeInsets.only(
          left: cardConfigs.marginModel.left,
          right: cardConfigs.marginModel.right,
          top: cardConfigs.marginModel.top,
          bottom: cardConfigs.marginModel.bottom,
        ),
        color: cardConfigs.color,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: cardConfigs.shouldShowImage,
                child: Image.asset(ImagePath.openAiLogo2),
              ),
              Container(
                width: 8,
              ),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CardImageTextModel defineCardConfigsByRole(String role) {
    final CardImageTextModel cardConfigs;

    if (role == ChatStrings.roleUser) {
      cardConfigs = getCardUserSettings();
    } else {
      cardConfigs = getCardAssistantSettings();
    }

    return cardConfigs;
  }

  CardImageTextModel getCardUserSettings() {
    return CardImageTextModel(
      marginModel: CardMarginModel(
        top: 16,
        left: 40,
        right: 20,
        bottom: 16,
      ),
      color: const Color(0xFF6750A4),
      shouldShowImage: false,
      radius: 60,
    );
  }

  CardImageTextModel getCardAssistantSettings() {
    return CardImageTextModel(
      marginModel: CardMarginModel(
        top: 16,
        left: 20,
        right: 40,
        bottom: 16,
      ),
      color: const Color(0x335C5C5C),
      shouldShowImage: true,
      radius: 20,
    );
  }
}
