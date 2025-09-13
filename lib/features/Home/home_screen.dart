import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:taskati/features/Home/widgets/Date_Row.dart';
import 'package:taskati/features/Home/widgets/home_header.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/features/Home/widgets/task_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              HomeHeader(),
              Gap(30),
              DateRow(),
              Gap(30),
              DatePicker(
                width: 70,
                height: 95,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {},
              ),
              Gap(30),
              taskBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
