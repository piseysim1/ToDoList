import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/core/image/image.dart';
import 'package:todolist_app/app/core/theme/theme.dart';
import 'package:todolist_app/app/modules/component/loginwiget/button_text.dart';
import 'package:todolist_app/app/modules/component/loginwiget/container_image.dart';
import 'package:todolist_app/app/modules/component/loginwiget/input_form.dart';
import 'package:todolist_app/app/routes/app_pages.dart';

import '../../../controllers/td_controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          color: Colors.black,
          onPressed: () => Get.back(),
        ),
        backgroundColor : Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: null,
      ),
      body: Stack(
        children: [
          // 1. Base background
          Container(color: const Color(0xFFF8F9FB)), // Slightly off-white
          // 2. The Color Blobs (Increased sizes for a smoother blend)
          Positioned(
            top: -100,
            left: -50,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withOpacity(0.15), // Top-left Green
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: -100,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.12), // Top-right Blue
              ),
            ),
          ),
          // Added a subtle yellow/orange blob for that "Aurora" feel
          Positioned(
            bottom: 100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange.withOpacity(0.05),
              ),
            ),
          ),
          // 3. The Blur Layer (Crucial: Use high Sigma for the "Mesh" effect)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(color: Colors.transparent),
          ),
          // 4. Your UI Content
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 180),
              const Center(
                child: Text(
                  "Welcome Back !",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F1F1F),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              InputForm(
                hintText: "Enter your email.",
                borderRadius: BorderRadius.circular(30),
              ),
              const SizedBox(height: 35),
              InputForm(
                hintText: "Enter your password.",
                borderRadius: BorderRadius.circular(30),
              ),
              const SizedBox(height: 20),
              Text(
                "Forget password?",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: mainColor),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: 120,
                  height: 50,
                  child: ButtonText(
                    buttonName: "Login",
                    BGbotton: const Color(0xFF6338E1),
                    onPressed: () {
                      Get.toNamed(Routes.HOME);
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              const Center(
                child: Text(
                  "Or",
                  style: TextStyle(
                    fontSize: 16,
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerImage(width: 40, height: 40, imageUrl: google_image),
                  SizedBox(width: 20),
                  ContainerImage(
                    width: 40,
                    height: 40,
                    imageUrl: facebook_image,
                  ),
                  SizedBox(width: 20),
                  ContainerImage(width: 40, height: 40, imageUrl: apple_image),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account ?",
                    style: TextStyle(fontSize: 15, color: blackColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SIGNUP);
                    },
                    child: Text(
                      "sign up here",
                      style: TextStyle(fontSize: 15, color: mainColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
