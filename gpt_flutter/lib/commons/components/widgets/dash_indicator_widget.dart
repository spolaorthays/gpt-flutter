import 'package:flutter/material.dart';

class DashIndicatorWidget extends StatelessWidget {
  const DashIndicatorWidget(this.dashesQuantity);

  final int dashesQuantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 2,
          width: 12,
        ),
        Container(
          color: const Color(0xFFD0BCFF),
          width: 28,
          height: 2,
        ),
        const SizedBox(
          height: 2,
          width: 12,
        ),
        Container(
          color: const Color(0xFFD0BCFF),
          width: 28,
          height: 2,
        ),
        const SizedBox(
          height: 2,
          width: 12,
        ),
        Container(
          color: const Color(0xFFD0BCFF),
          width: 28,
          height: 2,
        ),
        const SizedBox(
          height: 2,
          width: 12,
        ),
      ],
    );
  }
}
