import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

enum ThemeMode { light, dark }

class AppThemeConfig extends ChangeNotifier {
  var _themeMode = ThemeMode.light;

  //Default theme
  static ThemeData lightTheme() => ThemeData(
      primarySwatch: MaterialColor(0XFF5256E8, primaryColor),
      fontFamily: GoogleFonts.overpass().fontFamily);

  static ThemeData darkTheme() => ThemeData();

  ThemeMode get appThemeMode {
    return _themeMode;
  }

  ThemeData get currentAppTheme {
    return _themeMode == ThemeMode.light ? lightTheme() : darkTheme();
  }

  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
  }
}
