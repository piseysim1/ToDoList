import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todolist_app/app/core/theme/theme.dart';
import 'package:todolist_app/app/modules/component/loginwiget/button_text.dart';
import 'package:todolist_app/app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/start_controller.dart';

class StartView extends GetView<StartController> {
  const StartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      
      body: Stack(
        children: [
          // Background Gradient Glow
          Positioned(
            top: 0,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF83C78F).withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 146, 59, 172).withOpacity(0.1),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/female sitting on the floor with cup in hand and laptop on leg.png',
                          ), // Replace with your image
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Heading
                  Text(
                    "Task Management &\nTo-Do List",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2D2D2D),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Subtitle
                  Text(
                    "This productive tool is designed to help you better manage your task project-wise conveniently!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                  // Let's Start Button
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: ButtonText(
                        buttonName: "Let's Start",
                        BGbotton: const Color(0xFF6338E1),
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
