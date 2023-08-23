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
    return PageView(
      controller: controller,
      children: <Widget>[
        /*Column( //TODO Não funcionou nesse caso
          children: List.generate(imagePaths.length, (index) {
            return PageElementWidget(
              imagePath: imagePaths.elementAt(index),
              imageText: imageTexts.elementAt(index),
              cardText: cardTexts.elementAt(index),
              cardColor: rgboModel,
            );
          }),
        ),*/
        PageElementWidget(
          imagePath: imagePaths.elementAt(0),
          imageText: imageTexts.elementAt(0),
          cardText: cardTexts.elementAt(0),
          cardColor: cardColor,
        ),
        PageElementWidget(
          imagePath: imagePaths.elementAt(1),
          imageText: imageTexts.elementAt(1),
          cardText: cardTexts.elementAt(1),
          cardColor: cardColor,
        ),
        PageElementWidget(
          imagePath: imagePaths.elementAt(2),
          imageText: imageTexts.elementAt(2),
          cardText: cardTexts.elementAt(2),
          cardColor: cardColor,
        ),
      ],
    );
  }
}
