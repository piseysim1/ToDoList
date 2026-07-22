import 'package:get/get.dart';
import 'package:todolist_app/app/data/models/taskModel.model.dart';

class TodaytaskController extends GetxController {
  var selectedDate = DateTime.now().obs;

  var tasks = <TaskModel>[].obs;

  List<TaskModel> get tasksForSelectedDate {
    return tasks
        .where(
          (task) =>
              task.date.year == selectedDate.value.year &&
              task.date.month == selectedDate.value.month &&
              task.date.day == selectedDate.value.day,
        )
        .toList();
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
