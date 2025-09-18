
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle titlestyle({
    Color? color,
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
    Color? color,
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
    Color? color,
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
