import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static Color get background => Color(0xffededed);
  static Color get transparent => Colors.transparent;
  static Color get dark25 => Color(0xffbfbfbf);
  static Color get dark50 => Color(0xff808080);
  static Color get dark65 => Color(0xff595959);
  static Color get dark80 => Color(0xff333333);
  static Color get red => Colors.redAccent.withOpacity(0.7);
}

class DarkColors {
  static Color get background => Color(0xff1a1a1a).withOpacity(0.88);
  static Color get transparent => Colors.transparent;
  static Color get white => Color(0xffF5F5F5); //80
  static Color get greyWhite => Color(0xffC9C9C9); //65
  static Color get darkGrey => Color(0xff6C6B6B); //25
  static Color get lightGrey => Color(0xffB1B1B1); //50
  static Color get red => Colors.redAccent.withOpacity(0.7);
  static Color get purple => Colors.purple[500]!;
}
