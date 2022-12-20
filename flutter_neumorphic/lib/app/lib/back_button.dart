import 'package:flutter/material.dart';

import '../src/neumorphic_box_shape.dart';
import '../src/theme/neumorphic_theme.dart';
import '../src/widget/button.dart';

class NeumorphicBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.all(18),
      style: const NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.flat,
      ),
      child: Icon(
        Icons.arrow_back,
        color: NeumorphicTheme.isUsingDark(context) ? Colors.white70 : Colors.black87,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
