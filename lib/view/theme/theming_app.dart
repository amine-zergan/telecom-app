import 'package:flutter/material.dart';
import 'package:telecom/view/theme/color_constants.dart';

class ThemeApp {
  ThemeApp._();
  static ThemeData light = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    primaryColorLight: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
    ),
  );
  static ThemeData dark = ThemeData.dark().copyWith();
}
