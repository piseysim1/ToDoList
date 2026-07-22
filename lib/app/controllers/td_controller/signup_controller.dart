import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist_app/app/routes/app_pages.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();
  final box = GetStorage();
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void regsiterUser() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Erorr", "Please fil is all fields");
      return;
    }
    box.write('registered_email', email);
    box.write('registered_password', password);
    Get.snackbar(
      "Success",
      "Account created! Please log in",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    Get.offNamed(Routes.LOGIN);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
