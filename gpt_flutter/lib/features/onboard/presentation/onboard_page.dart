import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../commons/components/model/card_text_model.dart';
import '../../../commons/components/widgets/card_text_widget.dart';
import '../../../commons/components/widgets/image_text_widget.dart';

class OnboardWidget extends StatelessWidget {
  const OnboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/open_ai_logo.png'),
              ),
              const Text(
                'Welcome to Chat GPT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Ask anything, get yout answer',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              const ImageTextWidget(
                imagePath: 'assets/images/open_ai_logo.png',
                imageText: 'Examples',
              ),
              CardTextWidget(
                cardText:
                    'Remembers what user said earlier in the conversation',
                rgboColors: CardTextModel(255, 255, 255, 0.08),
              ),
              ElevatedButton(
                onPressed: () => context.go(
                  '/chat',
                ),
                child: const Text(
                  'Lets go',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
