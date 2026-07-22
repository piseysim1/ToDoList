import 'package:todolist_app/app/data/models/sub_task_item.model.dart';

class TaskModel {
  String id;
  String title;
  String category;
  String time;
  String status;
  DateTime date;
  final List<SubTaskItem> subTasks;

  TaskModel({
    required this.id,
    required this.title,
    required this.category,
    required this.time,
    required this.status,
    required this.date,
    this.subTasks = const [],
  });
}
