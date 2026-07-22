class TaskModel {
  String id;
  String title;
  String category;
  String time;
  String status; 
  DateTime date;

  TaskModel({
    required this.id,
    required this.title,
    required this.category,
    required this.time,
    required this.status,
    required this.date,
  });
}