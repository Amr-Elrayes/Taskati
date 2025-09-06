import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_buttom.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';
import 'package:taskati/features/Adding%20Task/widgets/color_field.dart';
import 'package:taskati/features/Adding%20Task/widgets/date_field.dart';
import 'package:taskati/features/Adding%20Task/widgets/time_field.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var titlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var datecontroller = TextEditingController(
    text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  );
  var starttimecontroller = TextEditingController(
    text: DateFormat("hh:mm a").format(DateTime.now()),
  );
  var endtimecontroller = TextEditingController(
    text: DateFormat("hh:mm a").format(DateTime.now()),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              size: 30,
              color: AppColors.primaryColor,
            ),
          ),
          title: Text(
            "Add Task",
            style: TextStyles.titlestyle(
              color: AppColors.primaryColor,
              fontSize: 20,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: TextStyles.titlestyle(
                    fontweight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Gap(10),
                customTextformfield(
                  controller: titlecontroller,
                  hintText: "Enter title",
                ),
                Gap(10),
                Text(
                  "Description",
                  style: TextStyles.titlestyle(
                    fontweight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Gap(10),
                customTextformfield(
                  controller: descriptioncontroller,
                  hintText: "Enter Description",
                  maxlines: 7,
                ),
                Gap(10),
                DateField(datecontroller: datecontroller),
                Gap(20),
                Row(
                  children: [
                    Expanded(
                      child: TimeField(
                        timecontroller: starttimecontroller,
                        time: "Start",
                      ),
                    ),
                    Gap(15),
                    Expanded(
                      child: TimeField(
                        timecontroller: endtimecontroller,
                        time: "End",
                      ),
                    ),
                  ],
                ),
                Gap(15),
                ColorField(),
                Gap(20),
                customButtom(txt: "Create Task", onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
