class SubTaskItem {
  String title;
  bool isCompleted = false;

  SubTaskItem({required this.title, this.isCompleted = false});
  Map<String, dynamic> toJson() => {'title': title, 'isCompleted': isCompleted};

  factory SubTaskItem.fromJson(Map<String, dynamic> json) => SubTaskItem(
    title: json['title'] as String,
    isCompleted: json['isCompleted'] as bool? ?? false,
  );
}
