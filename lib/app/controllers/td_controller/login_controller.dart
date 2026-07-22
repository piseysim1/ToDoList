import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final box = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() {
    final typedEmail = emailController.text.trim();
    final typedPassword = passwordController.text.trim();

    final savedEmail = box.read('registered_email');
    final savedPassword = box.read('registered_password');

    if (savedEmail == null || savedPassword == null) {
      Get.snackbar(
        "No Account Found",
        "Please signUp first!",
        backgroundColor: Colors.orangeAccent,
        colorText: Colors.white,
      );
      return;
    }
    if (typedEmail == savedEmail && typedPassword == savedPassword) {
      box.write("isLoggedIn", true);
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar(
        "Login Failed",
        "Incorrect email or password",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  void loginWithGoogle() {
    Get.snackbar('Google Sing In', "Google login Clicked");
  }

  void loginWithFacebook() {
    Get.snackbar("Facebook Sign In", "Facebook login clicked");
  }

  void forgotPassword() {
    Get.snackbar("Forgot Password", "Redirecting to password recovery...");
  }

  @override
  void onReady() {
    super.onReady();
  }
}
