import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class ColorField extends StatefulWidget {
  const ColorField({super.key});

  @override
  State<ColorField> createState() => _ColorFieldState();
}

class _ColorFieldState extends State<ColorField> {
  List<Color> taskColors = [
    AppColors.primaryColor,
    AppColors.redColor,
    AppColors.orangeColor,
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: TextStyles.titlestyle(
            fontweight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        Gap(10),
        Row(
          spacing: 20,
          children: List.generate(3, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: CircleAvatar(
                radius: 23,
                backgroundColor: taskColors[index],
                child: currentIndex == index
                    ? Icon(Icons.check, color: AppColors.bgColor)
                    : null,
              ),
            );
          }),
        ),
      ],
    );
  }
}
