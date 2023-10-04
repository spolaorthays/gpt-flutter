import 'package:flutter/material.dart';
import 'package:gpt_flutter/commons/components/widgets/dash_indicator_widget.dart';
import 'package:gpt_flutter/commons/components/widgets/page_element_widget.dart';

class OnboardPageViewWidget extends StatefulWidget {
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
  State<StatefulWidget> createState() => OnboardPageViewState();
}

class OnboardPageViewState extends State<OnboardPageViewWidget> {
  int selectedIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: controller,
            itemCount: widget.imagePaths.length,
            itemBuilder: (context, index) {
              return PageElementWidget(
                imagePath: widget.imagePaths.elementAt(index),
                imageText: widget.imageTexts.elementAt(index),
                cardText: widget.cardTexts.elementAt(index),
                cardColor: widget.cardColor,
              );
            },
            onPageChanged: (pageIndex) {
              setState(() {
                selectedIndex = pageIndex;
              });
            },
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: DashIndicatorWidget(widget.imagePaths.length, selectedIndex),
          ),
        ),
      ],
    );
  }
}
