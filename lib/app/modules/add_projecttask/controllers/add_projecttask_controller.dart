import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/controllers/task_controller.dart';

class AddProjecttaskController extends GetxController {
  final TaskController globalTaskController = Get.put(TaskController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  void SaveTask() {
    if (nameController.text.isNotEmpty) {
      globalTaskController.addTask(
        nameController.text,
        descriptionController.text,
      );
      nameController.clear();
      descriptionController.clear();
      Get.back();
    }
  }
}
