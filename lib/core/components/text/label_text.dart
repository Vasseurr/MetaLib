import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  String label;
  Color textColor;
  double fontSize;
  FontWeight fontWeight;

  LabelText({
    required this.label,
    this.textColor = Colors.black,
    this.fontSize = 15,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
