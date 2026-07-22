import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/Screen/ui/add_projecttask/add_projecttask_view.dart';
import 'package:todolist_app/app/Screen/ui/home/home_view.dart';
import 'package:todolist_app/app/Screen/ui/todaytask/TodaytaskView.dart';
import 'package:todolist_app/app/controllers/td_controller/navigation_controller.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());
    final List<Widget> pages = [
      const HomeView(),
      const TodaytaskView(),
      const AddProjecttaskView(),
    ];

    return Scaffold(
      body: Obx(
        () =>
            IndexedStack(index: controller.currentIndex.value, children: pages),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) => controller.changeIndex(index),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Today',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'Add Project',
            ),
          ],
        ),
      ),
    );
  }
}
