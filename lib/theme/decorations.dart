import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neu_weather/theme/colors.dart';

class Decorations {
  BoxDecoration gradientDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [lighBlue, blue],
    ),
  );
}
