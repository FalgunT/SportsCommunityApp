import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectTheme {
  static Color primaryColor = const Color(0xff662E9A);
  static Color primaryColorTrans = const Color(0xff241a40);
  static Color primaryBottomColorTrans = const Color(0x87231034);
  static Color primaryAccentColor = Colors.black54;
  static Color onBackground = const Color(0xff1E1E1E);
  static List<Color> gradientBGColors = const [
    Color(0xff241a40),
    Color(0xff1c1933),
    Color(0xff171625),
    Color(0xff161522),
    Color(0xff15131f),
    Color(0xff14121c),
    Color(0xff161223),
    Color(0xff191229),
    Color(0xff1e122f),
    Color(0xff231034),
  ];

  static getBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: ProjectTheme.gradientBGColors,
      ),
    );
  }
}
