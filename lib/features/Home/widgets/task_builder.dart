import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/features/Home/widgets/task_item.dart';
import 'package:taskati/services/local_helper.dart';

class taskBuilder extends StatelessWidget {
  const taskBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: LocalHelper.taskBox.listenable(),
        builder: (context, Box, child) {
          var tasks = Box.values.toList();
          return ListView.separated(
            itemBuilder: (context, index) {
              return taskItem(model: tasks[index],);
            },
            separatorBuilder: (context, index) {
              return Gap(10);
            },
            itemCount: tasks.length,
          );
        }
      ),
    );
  }
}
