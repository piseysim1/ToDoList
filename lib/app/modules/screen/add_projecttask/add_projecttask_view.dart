import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/core/theme/theme.dart';
import 'package:todolist_app/app/controllers/td_controller/add_projecttask_controller.dart';
import 'package:todolist_app/app/modules/component/homewiget/titleheader.dart';
import 'package:todolist_app/app/modules/component/project-add-widget/containerproject_widget.dart';
import 'package:todolist_app/app/modules/component/project-add-widget/datecontainer.dart';
import 'package:todolist_app/app/modules/component/project-add-widget/list_task.dart';
import 'package:todolist_app/app/modules/component/project-add-widget/task_groundcontainer.dart';

class AddProjecttaskView extends GetView<AddProjecttaskController> {
  const AddProjecttaskView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF7B4DFF),
        onPressed: () => _showAddTaskSheet(context),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: false,
        title: _buildAppBarTitle(),
      ),
      body: Stack(children: [_buildGlassBackground(), _buildMainList()]),
    );
  }

  Widget _buildAppBarTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Add Project",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Icon(Icons.notifications, color: blackColor),
      ],
    );
  }

  Widget _buildGlassBackground() {
    return Stack(
      children: [
        Container(color: const Color(0xFFF8F9FB)),
        Positioned(
          top: -100,
          left: -50,
          child: _blob(400, Colors.green.withOpacity(0.15)),
        ),
        Positioned(
          top: 50,
          right: -100,
          child: _blob(350, Colors.blue.withOpacity(0.12)),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }

  Widget _blob(double size, Color color) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );

  Widget _buildMainList() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        const SizedBox(height: 120),
        TaskGroupcontainer(
          bgvalues: pinklight,
          title: 'Task Group',
          subTitle: 'Work',
          iconTaskgroup: Icons.business_center,
          bgIcon: pink60,
          iconColor: pink80,
          values: 0.6,
          valuesColor: pink80,
        ),
        const SizedBox(height: 20),
        const ContainerprojectWidget(
          title: 'Project Name',
          subTitle: 'Grocery Shopping App',
          width: 120,
          height: 120,
        ),
        const SizedBox(height: 20),
        const ContainerprojectWidget(
          title: 'Description',
          subTitle: 'A one-stop solution for daily shopping needs.',
          width: 150,
          height: 200,
        ),
        const SizedBox(height: 20),
        Datecontainer(
          title: 'Start Date',
          initialDate: DateTime(2025, 5, 1),
          iconTaskgroup: Icons.calendar_month_rounded,
          bgIcon: Colors.transparent,
          iconColor: mainColor,
        ),
        const SizedBox(height: 10),
        Titleheader(lable_text: 'All Task '),
        ListTask(),
        const SizedBox(height: 20),
      ],
    );
  }
  void _showAddTaskSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Add Task",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7B4DFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () => controller.SaveTask(),
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
