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
  static ThemeData ligthTheme(BuildContext context) {
    return ThemeData.light().copyWith(
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(),
        hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        focusedBorder: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(),
        focusedErrorBorder: const OutlineInputBorder(),
        disabledBorder: const OutlineInputBorder(),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(),
        errorStyle:
            Theme.of(context).textTheme.labelLarge!.copyWith(color: errorColor),
        hintStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Colors.grey.shade600),
        labelStyle: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: Colors.white),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        focusedBorder: const OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorColor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorColor,
          ),
        ),
        disabledBorder: const OutlineInputBorder(),
      ),
    );
  }
}
