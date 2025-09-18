import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_buttom.dart';
import 'package:taskati/features/Adding%20Task/add_edit_task.dart';

class DateRow extends StatelessWidget {
  const DateRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMd().format(DateTime.now()).toString(),
              style: TextStyles.titlestyle(),
            ),
            Text("Today", style: TextStyles.titlestyle()),
          ],
        ),
        customButtom(
          txt: "+ Add Task",
          onPressed: () {
            pushTo(context, AddEditTask());
          },
          width: 150,
          height: 60,
        ),
      ],
    );
  }
}
