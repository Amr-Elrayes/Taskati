import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/features/Home/widgets/task_item.dart';
import 'package:taskati/services/local_helper.dart';

class taskBuilder extends StatefulWidget {
  taskBuilder({super.key});

  @override
  State<taskBuilder> createState() => _taskBuilderState();
}

class _taskBuilderState extends State<taskBuilder> {
  String selecteddate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          DatePicker(
            width: 70,
            height: 95,
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: AppColors.primaryColor,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              setState(() {
                selecteddate = DateFormat("yyyy-MM-dd").format(date);
              });
            },
          ),
          Gap(30),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: LocalHelper.taskBox.listenable(),
              builder: (context, Box, child) {
                List<TaskModel> tasks = [];
                for (var task in Box.values) {
                  if (task.date == selecteddate) {
                    tasks.add(task);
                  }
                }
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return taskItem(model: tasks[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Gap(10);
                  },
                  itemCount: tasks.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
