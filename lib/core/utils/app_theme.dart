import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_fonts.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class AppTheme {
  static get lightTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.darkColor,
    ),
    fontFamily: AppFonts.poppins,
    scaffoldBackgroundColor: AppColors.bgColor,
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.bgColor,
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.smallstyle(fontSize: 18),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.redColor, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.redColor, width: 1),
      ),
    ),
  );

  static get dartTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.bgColor,
    ),

    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.darkColor,
      headerForegroundColor: AppColors.bgColor,
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.darkColor,
      dialBackgroundColor: AppColors.darkColor,
    ),
    fontFamily: AppFonts.poppins,
    scaffoldBackgroundColor: AppColors.darkColor,
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.darkColor,
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.smallstyle(fontSize: 18),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.redColor, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.redColor, width: 1),
      ),
    ),
  );
}
