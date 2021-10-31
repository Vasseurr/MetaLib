import 'package:flutter/material.dart';

class ColorSchemeLight {
  static late ColorSchemeLight _instace;
  static ColorSchemeLight get instance {
    _instace = ColorSchemeLight._init();
    return _instace;
  }

  ColorSchemeLight._init();

  final Color colorBlue = Color(0xFF00C6B8);
  final Color colorSolidBlack = Color(0xFF393e46);
  final Color colorBlack = Color(0xFF222831);
  final Color colorWhite = Color(0xFFeeeeee);
}
