import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? date;
  @HiveField(4)
  String? starttime;
  @HiveField(5)
  String? endtime;
  @HiveField(6)
  int? color;
  @HiveField(7)
  bool isCompleted = false;

  TaskModel(
    this.id,
    this.title,
    this.description,
    this.date,
    this.starttime,
    this.endtime,
    this.color,
    this.isCompleted,
  );

  TaskModel copywith({
    String? id,
    String? title,
    String? description,
    String? date,
    String? starttime,
    String? endtime,
    int? color,
    bool? isCompleted,
  }) {
    return TaskModel(
      id ?? this.id,
      title ?? this.title,
      description ?? this.description,
      date ?? this.date,
      starttime ?? this.starttime,
      endtime ?? this.endtime,
      color ?? this.color,
      isCompleted ?? this.isCompleted,
    );
  }
}
