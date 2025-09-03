
import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

class TextStyles {
  static TextStyle titlestyle({
    Color color = AppColors.darkColor,
    double fontSize = 18,
    FontWeight fontweight = FontWeight.w600,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight:fontweight,
    );
  }
  static TextStyle bodystyle({
    Color color = AppColors.darkColor,
    double fontSize = 16,
    FontWeight fontweight = FontWeight.w600,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontweight,
    );
  }
  static TextStyle smallstyle({
    Color color = AppColors.grayColor,
    double fontSize = 14,
    FontWeight fontweight = FontWeight.w600,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontweight,
    );
  }
}
