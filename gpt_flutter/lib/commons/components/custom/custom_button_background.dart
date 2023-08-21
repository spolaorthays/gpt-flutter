import 'package:flutter/material.dart';

class CustomButtonBackground implements MaterialStateProperty<Color?> {
  CustomButtonBackground(this.context);

  final BuildContext context;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return const Color.fromARGB(255, 121, 99, 175);
    } else if (states.contains(MaterialState.hovered)) {
      return const Color.fromARGB(255, 95, 75, 145);
    }
    return const Color(0xFF4F378B);
  }
}
