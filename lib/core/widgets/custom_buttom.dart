import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

// ignore: must_be_immutable
class customButtom extends StatelessWidget {
  customButtom({
    super.key,
    required this.txt,
    required this.onPressed,
    this.color = AppColors.primaryColor,
    this.txtColor = AppColors.bgColor,
    this.icon,
    this.width = double.infinity,
    this.height = 70,
  });
  final String txt;
  final Function() onPressed;
  Color color;
  Color txtColor;
  IconData? icon;
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(icon, color: AppColors.primaryColor, size: 25),
            ),
            Center(
              child: Text(
                txt,
                style: TextStyles.titlestyle(
                  color: AppColors.bgColor,
                  fontweight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
