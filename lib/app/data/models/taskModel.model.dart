
class TaskModel {
  String name;
  String? description;
  bool isCompleted;
  TaskModel({
    required this.name,
    this.description,
    this.isCompleted = false,
  });
}
