import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpt_flutter/commons/components/custom/custom_button_background.dart';

import '../../../commons/components/model/card_text_model.dart';
import '../../../commons/components/widgets/onboard_pageview_widget.dart';

class OnboardWidget extends StatelessWidget {
  List<String> paths = [
    'assets/images/icon_sun.png',
    'assets/images/icon_ray.png',
    'assets/images/icon_attention.png',
  ];

  List<String> iTexts = [
    'Examples',
    'Capabilities',
    'Limitations',
  ];

  List<List<String>> cTexts = [
    [
      '“Explain quantum computing in simple terms”',
      '“Got any creative ideas for a 10 year old’s birthday?”',
      '“How do I make an HTTP request in Javascript?”',
    ],
    [
      'Remembers what user said earlier in the conversation',
      'Allows user to provide follow-up corrections',
      'Trained to decline inappropriate requests',
    ],
    [
      'May occasionally generate incorrect information',
      'May occasionally produce harmful instructions or biased content',
      'Limited knowledge of world and events after 2021',
    ]
  ];

  OnboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF141218),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 82),
              child: Container(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/open_ai_logo.png'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                'Welcome to Chat GPT',
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
                'Ask anything, get yout answer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            Expanded(
              child: OnboardPageViewWidget(
                imagePaths: paths,
                imageTexts: iTexts,
                cardTexts: cTexts,
                rgboModel: CardTextModel(255, 255, 255, 0.08),
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
                    '/chat',
                  ),
                  child: const Text(
                    'Let\u0027s go',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
