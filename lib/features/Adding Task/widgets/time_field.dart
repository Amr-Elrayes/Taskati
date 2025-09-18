import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';

class TimeField extends StatelessWidget {
  const TimeField({
    super.key,
    required this.timecontroller,
    required this.time,
  });

  final TextEditingController timecontroller;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$time Time",
          style: TextStyles.titlestyle(
            fontweight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        Gap(10),
        customTextformfield(
          readonly: true,
          ontap: () async {
            var selectedtime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (selectedtime != null) {
              timecontroller.text = selectedtime.format(context);
            }
          },
          controller: timecontroller,
          icon: Icon(
            Icons.access_time,
            size: 20,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
