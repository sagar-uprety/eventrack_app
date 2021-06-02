import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTheme {
  static get darkTheme => _darkTheme;

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    platform: TargetPlatform.android,
    fontFamily: 'Sarabun',
    textTheme: AppTextTheme(),
    applyElevationOverlayColor: true,

    //Colors
    scaffoldBackgroundColor: AppColors.background,
    primarySwatch: Colors.cyan,
    primaryColor: AppColors.darkGrey,
    accentColor: AppColors.lightGrey,
    shadowColor: AppColors.white,
    disabledColor: AppColors.lightGrey,
    hintColor: AppColors.darkGrey,
    errorColor: AppColors.red,
    dividerColor: AppColors.lightGrey,

    //Icons
    primaryIconTheme: AppIconsTheme.primaryIconTheme,
    accentIconTheme: AppIconsTheme.accentIconTheme,

    //Bars
    appBarTheme: BarsTheme.appBarTheme,
    bottomNavigationBarTheme: BarsTheme.buttomNavBarTheme,
    tabBarTheme: BarsTheme.tabBarTheme,
    //Widgets
    dividerTheme: AppWidgetsTheme.dividerTheme,
    chipTheme: AppWidgetsTheme.chipTheme,
    popupMenuTheme: AppWidgetsTheme.popUpMenuTheme,
    dialogTheme: AppWidgetsTheme.dialogTheme,
    cardTheme: AppWidgetsTheme.cardTheme,
    bottomSheetTheme: AppWidgetsTheme.bottomSheetTheme,
    textButtonTheme: AppWidgetsTheme.textButtonTheme,
    elevatedButtonTheme: AppWidgetsTheme.elevatedButtonTheme,
    outlinedButtonTheme: AppWidgetsTheme.outlinedButtonTheme,
    checkboxTheme: AppWidgetsTheme.checkboxTheme,
    switchTheme: AppWidgetsTheme.switchTheme,
    inputDecorationTheme: AppWidgetsTheme.inputDecorationTheme,
  );
}

class AppTextTheme extends TextTheme {
  @override
  TextStyle get headline1 => TextStyle(
        color: AppColors.white,
        letterSpacing: 1.3,
        fontSize: 44,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get headline2 => TextStyle(
        color: AppColors.white,
        letterSpacing: 1.3,
        fontSize: 36,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get headline3 => TextStyle(
        color: AppColors.white,
        letterSpacing: 1.3,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get headline4 => TextStyle(
        color: AppColors.white,
        letterSpacing: 1.3,
        fontSize: 28,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get headline5 => TextStyle(
        color: AppColors.lightGrey,
        letterSpacing: 1.3,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get headline6 => TextStyle(
        color: AppColors.white,
        letterSpacing: 1.5,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get bodyText1 => TextStyle(
        color: AppColors.white,
        letterSpacing: 1.3,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get bodyText2 => TextStyle(
        color: AppColors.greyWhite,
        letterSpacing: 1.3,
        fontSize: 14,
        fontWeight: FontWeight.w300,
      );

  @override
  TextStyle get subtitle1 => bodyText1;

  @override
  TextStyle get subtitle2 => TextStyle(
        color: AppColors.white,
        letterSpacing: 1.3,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get caption => subtitle1.copyWith(
      color: AppColors.lightGrey, fontWeight: FontWeight.w500);

  @override
  TextStyle get overline => subtitle2;

  @override
  TextStyle get button => headline6.copyWith(fontWeight: FontWeight.w600);
}

abstract class BarsTheme {
  static final appBarTheme = AppBarTheme(
    backgroundColor: AppColors.transparent,
    elevation: 0,
    centerTitle: true,
    iconTheme: AppIconsTheme.primaryIconTheme,
    actionsIconTheme: AppIconsTheme.primaryIconTheme,
    titleSpacing: 0.7,
    titleTextStyle: AppTextTheme()
        .headline5
        .copyWith(letterSpacing: 0.3, color: AppColors.white),
  );

  static final buttomNavBarTheme = BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkGrey,
    elevation: 1,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedIconTheme: AppIconsTheme.primaryIconTheme,
    unselectedIconTheme: AppIconsTheme.accentIconTheme,
    type: BottomNavigationBarType.fixed,
  );

  static final tabBarTheme = TabBarTheme(
    indicator: UnderlineTabIndicator(
      insets: EdgeInsets.symmetric(horizontal: 5.0),
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: AppColors.white,
    labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    unselectedLabelColor: AppColors.lightGrey,
    labelStyle: AppTextTheme().headline6,
    unselectedLabelStyle: AppTextTheme().headline6,
  );
}

abstract class AppIconsTheme {
  static final primaryIconTheme = IconThemeData(
    color: AppColors.white,
    size: 24,
  );

  static final accentIconTheme = IconThemeData(
    color: AppColors.lightGrey,
    size: 24,
  );
}

abstract class AppWidgetsTheme {
  static final dividerTheme = DividerThemeData(
    thickness: 1,
    color: AppColors.lightGrey.withOpacity(0.38),
    indent: 15,
    endIndent: 15,
  );

  static final cardTheme = CardTheme(
    clipBehavior: Clip.hardEdge,
    elevation: 1,
    color: AppColors.darkGrey,
  );

  static final chipTheme = ChipThemeData(
    backgroundColor: AppColors.darkGrey,
    deleteIconColor: AppColors.greyWhite,
    disabledColor: AppColors.transparent,
    selectedColor: AppColors.lightGrey,
    secondarySelectedColor: AppColors.lightGrey,
    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
    showCheckmark: false,
    elevation: 0,
    pressElevation: 2,
    selectedShadowColor: AppColors.greyWhite,
    side: BorderSide(color: AppColors.lightGrey),
    brightness: Brightness.dark,
    labelStyle: AppTextTheme().bodyText2.copyWith(fontWeight: FontWeight.w500),
    secondaryLabelStyle: AppTextTheme().overline,
  );

  static final timePickerTheme = TimePickerThemeData(
    backgroundColor: AppColors.darkGrey,
    helpTextStyle: AppTextTheme().headline6,
    dialTextColor: AppColors.white,
    hourMinuteTextColor: AppColors.greyWhite,
    dayPeriodTextColor: AppColors.greyWhite,
  );

  static final dialogTheme = DialogTheme(
    backgroundColor: AppColors.darkGrey,
    elevation: 2,
    shape: Border.all(
      color: Colors.grey[600]!.withOpacity(0.6),
      width: double.infinity,
    ),
    titleTextStyle: AppTextTheme().headline4,
    contentTextStyle: AppTextTheme().subtitle2,
  );

  static final bottomSheetTheme = BottomSheetThemeData(
    backgroundColor: AppColors.darkGrey,
    elevation: 4,
    modalBackgroundColor: AppColors.darkGrey,
    modalElevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
    ),
  );

  static final popUpMenuTheme = PopupMenuThemeData(
    elevation: 3,
    color: AppColors.background,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    textStyle: AppTextTheme().bodyText2,
  );

  static final checkboxTheme = CheckboxThemeData(
    fillColor: MaterialStateProperty.all(AppColors.greyWhite),
    checkColor: MaterialStateProperty.all(AppColors.background),
    overlayColor: MaterialStateProperty.all(AppColors.greyWhite),
  );

  static final switchTheme = SwitchThemeData(
    thumbColor: MaterialStateProperty.all(AppColors.greyWhite),
    trackColor: MaterialStateProperty.all(AppColors.darkGrey),
    overlayColor: MaterialStateProperty.all(AppColors.darkGrey),
  );

  static final textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        AppTextTheme().headline6.copyWith(
              fontSize: 16,
              decoration: TextDecoration.none,
              fontFamily: 'Sarabun',
            ),
      ),
    ),
  );

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: AppTextTheme().bodyText1.copyWith(fontFamily: 'Sarabun'),
      primary: AppColors.purple,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      elevation: 5,
      minimumSize: Size(200, 44),
      shape: StadiumBorder(),
      alignment: Alignment.center,
    ),
  );

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: AppTextTheme().bodyText1.copyWith(fontFamily: 'Sarabun'),
      primary: AppColors.purple,
      onSurface: AppColors.red,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      elevation: 0,
      minimumSize: Size(200, 44),
      shape: StadiumBorder(),
      alignment: Alignment.center,
    ),
  );

  static final inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 16,
      color: AppColors.greyWhite,
      fontWeight: FontWeight.w500,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: EdgeInsets.symmetric(horizontal: 12),
    filled: true,
    alignLabelWithHint: true,
    fillColor: AppColors.darkGrey,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 3,
        color: AppColors.red,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        width: 5,
        color: AppColors.red,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.lightGrey,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    errorStyle: AppTextTheme().bodyText2.copyWith(color: AppColors.red),
    errorMaxLines: 1,
    counterStyle: TextStyle(
      fontSize: 16,
      color: AppColors.lightGrey,
      fontWeight: FontWeight.w500,
    ),
  );
}
