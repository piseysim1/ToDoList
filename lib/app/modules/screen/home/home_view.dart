import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/core/theme/theme.dart';
import 'package:todolist_app/app/modules/component/homewiget/project_card.dart';
import 'package:todolist_app/app/modules/component/homewiget/task_card.dart';
import 'package:todolist_app/app/modules/component/homewiget/taskproject.dart';
import 'package:todolist_app/app/modules/component/homewiget/titleheader.dart';
import 'package:todolist_app/app/routes/app_pages.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: false,
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
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // print("Notifications clicked");
            Get.toNamed(Routes.ADD_PROJECTTASK);
            },
          ),
          const SizedBox(width: 8),
        ],
        // ------------------------
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 16, left: 16),
        children: [
          TaskCard(),
          SizedBox(width: 10, height: 20),
          Titleheader(lable_text: "In Progress"),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProjectCard(
                category: 'Office Project',
                title: 'Grocery shopping app design',
                progress: 0.6,
                backgroundColor: bluelight,
                progressColor: blue50,
                icon: Icons.work,
              ),
              SizedBox(width: 20),
              ProjectCard(
                category: 'Personal Project',
                title: 'Uber Eats redesign challange',
                progress: 0.6,
                backgroundColor: pinklight,
                progressColor: orange50,
                icon: Icons.person,
              ),
            ],
          ),
          SizedBox(width: 10, height: 20),
          Titleheader(lable_text: "Task Groups"),
          SizedBox(height: 20),
          Taskproject(
            bgvalues: pinklight,
            title: 'Office Project',
            subTitle: '23 Tasks',
            iconTaskgroup: Icons.business_center,
            bgIcon: pink60,
            iconColor: pink80,
            values: 0.6,
            valuesColor: pink80,
            textPercent: '70%',
          ),
          SizedBox(height: 30),
          Taskproject(
            bgvalues: purple20,
            title: 'Personal Project',
            subTitle: '30 Tasks',
            iconTaskgroup: Icons.account_box,
            bgIcon: purple20,
            iconColor: purple50,
            values: 0.3,
            valuesColor: purple50,
            textPercent: '52%',
          ),
          SizedBox(height: 30),
          Taskproject(
            bgvalues: orangelight,
            title: 'Daily Study',
            subTitle: '30 Tasks',
            iconTaskgroup: Icons.auto_stories,
            bgIcon: orangelight,
            iconColor: orange50,
            values: 0.9,
            valuesColor: orange50,
            textPercent: '82%',
          ),
          SizedBox(height: 30),
          Taskproject(
            bgvalues: yellowlight,
            title: 'Daily Study',
            subTitle: '3 Tasks',
            iconTaskgroup: Icons.auto_stories,
            bgIcon: yellowlight,
            iconColor: yellow50,
            values: 0.9,
            valuesColor: yellow50,
            textPercent: '87%',
          ),
        ],
      ),
    );
  }
}
