import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_buttom.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var namecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime(bool isStart) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

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
            onPressed: () {},
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
                  controller: namecontroller,
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
                Text(
                  "Date",
                  style: TextStyles.titlestyle(
                    fontweight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Gap(10),
                GestureDetector(
                  onTap: _pickDate,
                  child: AbsorbPointer(
                    child: customTextformfield(
                      controller: TextEditingController(
                        text: selectedDate == null
                            ? DateFormat('yyyy-M-d').format(DateTime.now())
                            : DateFormat('yyyy-M-d').format(selectedDate!),
                      ),
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        size: 20,
                        color: AppColors.darkColor,
                      ),
                    ),
                  ),
                ),
                Gap(20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Start Time",
                            style: TextStyles.titlestyle(
                              fontweight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          Gap(10),
                          GestureDetector(
                            onTap: () => _pickTime(true),
                            child: AbsorbPointer(
                              child: customTextformfield(
                                controller: TextEditingController(
                                  text: startTime == null
                                      ? DateFormat(
                                          'hh:mm a',
                                        ).format(DateTime.now())
                                      : startTime!.format(context),
                                ),
                                icon: Icon(
                                  Icons.access_time,
                                  size: 20,
                                  color: AppColors.darkColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "End Time",
                            style: TextStyles.titlestyle(
                              fontweight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          Gap(10),
                          GestureDetector(
                            onTap: () => _pickTime(false),
                            child: AbsorbPointer(
                              child: customTextformfield(
                                controller: TextEditingController(
                                  text: endTime == null
                                      ? DateFormat(
                                          'hh:mm a',
                                        ).format(DateTime.now())
                                      : endTime!.format(context),
                                ),
                                icon: Icon(
                                  Icons.access_time,
                                  size: 20,
                                  color: AppColors.darkColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(15),
                Text(
                  "Color",
                  style: TextStyles.titlestyle(
                    fontweight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Gap(10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: AppColors.primaryColor,
                    ),
                    Gap(15),
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: AppColors.orangeColor,
                    ),
                    Gap(15),
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: AppColors.redColor,
                    ),
                  ],
                ),
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
