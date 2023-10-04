import 'package:flutter/material.dart';

class DashIndicatorWidget extends StatelessWidget {
  const DashIndicatorWidget(
    this.dashesQuantity,
    this.currentDashSelected, {
    super.key,
  });

  final int dashesQuantity;
  final int currentDashSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        dashesQuantity,
        (index) => AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 6.0),
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
          width: 28,
          height: 2,
          decoration: BoxDecoration(
              color: index == currentDashSelected
                  ? const Color(0xFFD0BCFF)
                  : const Color(0x33FFFFFF),
              borderRadius: BorderRadius.circular(60)),
        ),
      ),
    );
  }
}
