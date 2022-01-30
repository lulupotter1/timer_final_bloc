import 'package:flutter/material.dart';
import 'package:timer_final_bloc/utils/theme_colors.dart';

class ThemeTextRegular {
  static const fontWeight = FontWeight.w400;
  static const fontFamily = "Roboto";
  static const fontColor = ThemeColors.white;

  static const size24 = TextStyle(
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 24.0,
  );

  static const size14 = TextStyle(
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
  );
}

class ThemeTextBold {
  static const fontWeight = FontWeight.w700;
  static const fontFamily = "Roboto";
  static const fontColor = ThemeColors.white;

  static const size14 = TextStyle(
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
  );
}
