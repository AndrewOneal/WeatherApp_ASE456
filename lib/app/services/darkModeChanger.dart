import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';

class DarkModeChanger {
  static Color toggleDarkLightBG(Map<String, double?> userSettings) {
    var result = userSettings['darkMode'] == 0
        ? Colors.white
        : KThemeColors.bg_lightBlue;
    return result;
  }

  static Color toggleDarkLightText(Map<String, double?> userSettings) {
    var result = userSettings['darkMode'] == 0
        ? Colors.black
        : KThemeColors.text_dimWhite;
    return result;
  }
}
