import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';

class DateField extends StatelessWidget {
  const DateField({
    super.key,
    required this.datecontroller,
  });

  final TextEditingController datecontroller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Date",
          style: TextStyles.titlestyle(
            fontweight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        Gap(10),
        customTextformfield(
          readonly: true,
          ontap: () async {
            var selsctedDate = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime(2060),
            );
        
            if (selsctedDate != null) {
              datecontroller.text = DateFormat(
                "yyyy-MM-dd",
              ).format(selsctedDate);
            }
          },
          controller: datecontroller,
          icon: Icon(
            Icons.calendar_month_outlined,
            size: 20,
            color: AppColors.darkColor,
          ),
        ),
      ],
    );
  }
}
