import 'package:flutter/material.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/tasks_colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class taskItem extends StatelessWidget {
  const taskItem({
    super.key, required this.model,
  });
  final TaskModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: taskColors[model.color ?? 0],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  model.title ?? "",
                  style: TextStyles.bodystyle(
                    color: AppColors.bgColor,
                  ),
                ),
                Row(
                  spacing: 7,
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: AppColors.bgColor,
                      size: 16,
                    ),
                    Text(
                      "${model.starttime} : ${model.endtime}",
                      style: TextStyles.smallstyle(
                        color: AppColors.bgColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  model.description??"",
                  style: TextStyles.bodystyle(
                    color: AppColors.bgColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 80,
            color: AppColors.bgColor,
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              model.isCompleted ? "COMPLETED" : "TODO",
              style: TextStyles.bodystyle(
                color: AppColors.bgColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
