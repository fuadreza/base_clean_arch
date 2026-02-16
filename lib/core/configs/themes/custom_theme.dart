import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  final ThemeData light = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: ColorConstants.primary,
    dividerColor: Colors.white54,
    colorScheme: ThemeData.light().colorScheme.copyWith(
          surface: ColorConstants.white,
        ),
  );

  final ThemeData customLight = ThemeData(
    fontFamily: 'NunitoSans',
    primarySwatch: ColorConstants.materialPrimary,
    brightness: Brightness.light,
    dividerTheme: const DividerThemeData(
      thickness: 0.2,
      color: ColorConstants.outlineColor,
    ),
    primaryColor: ColorConstants.primary,
    colorScheme: ThemeData.light().colorScheme.copyWith(
          surface: ColorConstants.white,
        ),
    dividerColor: Colors.white54,
  );

  final ThemeData dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: ColorConstants.primary,
    colorScheme: ThemeData.light().colorScheme.copyWith(
          surface: ColorConstants.dark,
        ),
    dividerColor: Colors.black12,
  );
}
