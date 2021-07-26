import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static Color get background => dark10;
  static Color get transparent => Colors.transparent;
  static Color get dark10 => Color(0xffededed);
  static Color get cardColor => Color(0xffd9d9d9);
  static Color get dark25 => Color(0xffbfbfbf);
  static Color get dark50 => Color(0xff808080);
  static Color get dark65 => Color(0xff595959);
  static Color get dark80 => Color(0xff333333);
  static Color get green => Colors.greenAccent[400]!;
  static Color get yellow => Colors.yellow[600]!;
  static Color get red => Colors.redAccent.withOpacity(0.9);
  static Color get blue => Color(0xff0099ff);
  static Color get purple => Colors.purple[500]!;

  static RadialGradient imageGradient() => RadialGradient(
        center: Alignment.topRight,
        radius: 2.0,
        colors: <Color>[
          AppColors.dark65,
          AppColors.dark10,
        ],
      );
}
