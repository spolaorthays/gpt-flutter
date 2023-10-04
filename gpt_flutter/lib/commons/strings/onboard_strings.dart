import 'package:gpt_flutter/commons/strings/image_path_strings.dart';

abstract class OnboardStrings {
  OnboardStrings._();

  //String lists
  static const imagePaths = [
    ImagePath.iconSun,
    ImagePath.iconRay,
    ImagePath.iconAttention,
  ];

  static const imageTexts = [
    'Examples',
    'Capabilities',
    'Limitations',
  ];

  static const cardTextLists = [
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

  // Strings
  static const welcomeText = 'Welcome to Chat GPT';
  static const welcomeDescription = 'Ask anything, get yout answer';
  static const letsGoText = 'Let\u0027s go';

  //Route
  static const chatRoute = '/chat';
}
