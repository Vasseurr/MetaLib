import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get getHeight => mediaQuery.size.height;
  double get getWidth => mediaQuery.size.width;

  double get lowHeightValue => getHeight * 0.01;
  double get mediumHeightValue => getHeight * 0.04;
  double get highHeightValue => getHeight * 0.09;
  double get topHeightValue => getHeight * 0.15;

  double get lowWidthValue => getWidth * 0.01;
  double get mediumWidthValue => getWidth * 0.05;
  double get highWidthValue => getWidth * 0.08;
  double get topWidthValue => getWidth * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
  Color get specialRed => const Color.fromRGBO(129, 0, 0, 1);
  Color get specialBrown => const Color.fromRGBO(66, 14, 7, 1);
  Color get specialGreen => const Color.fromRGBO(0, 90, 7, 1);
  Color get specialYellow => const Color.fromRGBO(236, 143, 0, 1);
  Color get specialBlack => const Color.fromRGBO(41, 41, 41, 1);
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingHeightLow => EdgeInsets.all(lowHeightValue);
  EdgeInsets get paddingHeightMedium => EdgeInsets.all(mediumHeightValue);
  EdgeInsets get paddingHeightHigh => EdgeInsets.all(highHeightValue);

  EdgeInsets get paddingWidthLow => EdgeInsets.all(lowWidthValue);
  EdgeInsets get paddingWidthMedium => EdgeInsets.all(mediumWidthValue);
  EdgeInsets get paddingWidthHigh => EdgeInsets.all(highWidthValue);
}

extension MarginExtension on BuildContext {
  EdgeInsets get marginHeightLow => EdgeInsets.all(lowHeightValue);
  EdgeInsets get marginHeightMedium => EdgeInsets.all(mediumHeightValue);
  EdgeInsets get marginHeightHigh => EdgeInsets.all(highHeightValue);
  EdgeInsets get marginHeightMax => EdgeInsets.all(topHeightValue);

  EdgeInsets get marginWidthLow => EdgeInsets.all(lowWidthValue);
  EdgeInsets get marginWidthMedium => EdgeInsets.all(mediumWidthValue);
  EdgeInsets get marginWidthHigh => EdgeInsets.all(highWidthValue);
  EdgeInsets get marginWidthMax => EdgeInsets.all(topWidthValue);
}
