import 'package:get/get.dart';
import 'package:todolist_app/app/data/models/taskModel.model.dart';

class TaskController extends GetxController {
  var tasks = <TaskModel>[].obs;
  void addTask(String name, String? description) {
    tasks.add(TaskModel(name: name, description: description));
    print("Task Added: $name"); 
  }
}