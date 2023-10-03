import 'package:flutter/material.dart';
import 'package:gpt_flutter/commons/components/widgets/page_element_widget.dart';

class OnboardPageViewWidget extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> imageTexts;
  final List<List<String>> cardTexts;
  final Color cardColor;

  const OnboardPageViewWidget({
    super.key,
    required this.imagePaths,
    required this.imageTexts,
    required this.cardTexts,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView.builder(
      controller: controller,
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return PageElementWidget(
          imagePath: imagePaths.elementAt(index),
          imageText: imageTexts.elementAt(index),
          cardText: cardTexts.elementAt(index),
          cardColor: cardColor,
        );
      },
    );
  }
}
