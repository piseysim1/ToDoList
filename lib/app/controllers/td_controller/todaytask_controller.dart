import 'package:get/get.dart';
import 'package:todolist_app/app/data/models/taskModel.model.dart';

class TaskGroupSummary {
  final String title;
  final int taskCount;
  final double progress;

  TaskGroupSummary({
    required this.title,
    required this.taskCount,
    required this.progress,
  });
}

class TodaytaskController extends GetxController {
  var selectedDate = DateTime.now().obs;

  var tasks = <TaskModel>[].obs;

  List<TaskModel> get tasksForSelectedDate {
    return tasks.where((task) {
      return task.date.year == selectedDate.value.year &&
          task.date.month == selectedDate.value.month &&
          task.date.day == selectedDate.value.day;
    }).toList();
  }

  List<TaskGroupSummary> get taskGroupSummaries {
    final Map<String, List<TaskModel>> grouped = {};

    for (final task in tasks) {
      grouped.putIfAbsent(task.status, () => []).add(task);
    }

    return grouped.entries.map((entry) {
      final groupTasks = entry.value;

      int totalSubTasks = 0;
      int completedSubTasks = 0;

      for (final task in groupTasks) {
        totalSubTasks += task.subTasks.length;
        completedSubTasks += task.subTasks.where((s) => s.isCompleted).length;
      }

      final progress = totalSubTasks == 0
          ? 0.0
          : completedSubTasks / totalSubTasks;

      return TaskGroupSummary(
        title: entry.key,
        taskCount: groupTasks.length,
        progress: progress,
      );
    }).toList();
  }

  void changeSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  void addTask(TaskModel newTask) {
    tasks.add(newTask);
  }

  void updateTask(TaskModel updatedTask) {
    int index = tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      tasks[index] = updatedTask;
      tasks.refresh();
    }
  }

  void deleteTask(String taskId) {
    tasks.removeWhere((task) => task.id == taskId);
  }
}
