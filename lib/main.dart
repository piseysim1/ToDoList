import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/controllers/td_controller/task_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.put(TaskController(), permanent: true);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
