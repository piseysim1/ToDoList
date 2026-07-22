import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/Screen/components/homewidget/in_progress_section.dart';
import 'package:todolist_app/app/Screen/components/homewidget/task_card.dart';
import 'package:todolist_app/app/Screen/components/homewidget/task_groups_section.dart';
import 'package:todolist_app/app/Screen/components/homewidget/titleheader.dart';
import 'package:todolist_app/app/controllers/td_controller/todaytask_controller.dart';

class HomeView extends GetView<TodaytaskController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                "https://tse4.mm.bing.net/th/id/OIP.oIbNHbNsTZBCzhSyz_K3KAHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "Hello,",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "John Doe",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          TaskCard(),
          SizedBox(height: 20),
          Titleheader(lable_text: "In Progress"),
          SizedBox(height: 20),
          InProgressSection(),
          SizedBox(height: 20),
          Titleheader(lable_text: "Task Groups"),
          SizedBox(height: 20),
          TaskGroupsSection(),
        ],
      ),
    );
  }
}
