import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpt_flutter/commons/components/custom/custom_button_background.dart';
import 'package:gpt_flutter/commons/strings/image_path_strings.dart';
import 'package:gpt_flutter/commons/strings/onboard_strings.dart';

import '../../../commons/components/widgets/onboard_pageview_widget.dart';

class OnboardWidget extends StatelessWidget {
  OnboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141218),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 82),
            child: Container(
              alignment: Alignment.topCenter,
              child: Image.asset(ImagePath.openAiLogo),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24),
            child: Text(
              OnboardStrings.welcomeText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24),
            child: Text(
              OnboardStrings.welcomeDescription,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
          const Expanded(
            child: OnboardPageViewWidget(
              imagePaths: OnboardStrings.imagePaths,
              imageTexts: OnboardStrings.imageTexts,
              cardTexts: OnboardStrings.cardTextLists,
              cardColor: Color(0x335C5C5C),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 24,
                left: 20,
                right: 20,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: CustomButtonBackground(context),
                ),
                onPressed: () => context.go(
                  OnboardStrings.chatRoute,
                ),
                child: const Text(
                  OnboardStrings.letsGoText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
