import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTheme {
  static get lightTheme => _lightTheme;

  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    platform: TargetPlatform.android,
    fontFamily: 'Sarabun',
    textTheme: _textTheme,
    applyElevationOverlayColor: true,

    // Colors
    scaffoldBackgroundColor: AppColors.background,
    primarySwatch: Colors.blueGrey,
    primaryColor: AppColors.dark50,
    accentColor: AppColors.dark50,
    shadowColor: AppColors.dark80,
    disabledColor: AppColors.dark50,
    hintColor: AppColors.dark25,
    errorColor: AppColors.red,
    dividerColor: AppColors.dark50,

    // Widget Theme
    primaryIconTheme: _primaryIconTheme,
    accentIconTheme: _accentIconTheme,
    timePickerTheme: _timePickerTheme,
  );

  static final TextTheme _textTheme = TextTheme(
    headline1: TextStyle(
      color: AppColors.dark80,
      letterSpacing: 1.3,
      fontSize: 44,
      fontWeight: FontWeight.w600,
    ),
    headline2: TextStyle(
      color: AppColors.dark80,
      letterSpacing: 1.3,
      fontSize: 36,
      fontWeight: FontWeight.w600,
    ),
    headline3: TextStyle(
      color: AppColors.dark80,
      letterSpacing: 1.3,
      fontSize: 32,
      fontWeight: FontWeight.w500,
    ),
    headline4: TextStyle(
      color: AppColors.dark80,
      letterSpacing: 1.3,
      fontSize: 28,
      fontWeight: FontWeight.w500,
    ),
    headline5: TextStyle(
      color: AppColors.dark50,
      letterSpacing: 1.3,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    headline6: TextStyle(
      color: AppColors.dark80,
      letterSpacing: 1.5,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    bodyText1: TextStyle(
      color: AppColors.dark80,
      letterSpacing: 1.3,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    bodyText2: TextStyle(
      color: AppColors.dark65,
      letterSpacing: 1.3,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
    subtitle1: TextStyle(
      color: AppColors.dark80,
      letterSpacing: 1.3,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    subtitle2: TextStyle(
      color: AppColors.dark80,
      letterSpacing: 1.3,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    caption: TextStyle(
      color: AppColors.dark50,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.3,
      fontSize: 18,
    ),
    overline: TextStyle(
      color: AppColors.dark80,
      letterSpacing: 1.3,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    button: TextStyle(
      color: AppColors.dark10,
      letterSpacing: 1.5,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );

  static final _primaryIconTheme = IconThemeData(
    color: AppColors.dark65,
    size: 24,
  );

  static final _accentIconTheme = IconThemeData(
    color: AppColors.dark50,
    size: 24,
  );

  static final _timePickerTheme = TimePickerThemeData(
    backgroundColor: AppColors.dark10,
    helpTextStyle: _textTheme.headline6,
    dialTextColor: AppColors.dark80,
    hourMinuteTextColor: AppColors.dark65,
    dayPeriodTextColor: AppColors.dark65,
  );
}
