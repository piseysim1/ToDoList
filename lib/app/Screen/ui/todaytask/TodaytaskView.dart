import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/Screen/ui/add_projecttask/add_projecttask_view.dart';
import 'package:todolist_app/app/Screen/ui/todaytask/components/aurora_background.dart';
import 'package:todolist_app/app/Screen/ui/todaytask/components/horizontal_calendar.dart';
import 'package:todolist_app/app/controllers/td_controller/todaytask_controller.dart';
import 'package:todolist_app/app/data/models/taskModel.model.dart';

class TodaytaskView extends GetView<TodaytaskController> {
  const TodaytaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Today’s Tasks',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: AuroraBackground(
        child: Column(
          children: [
            const SizedBox(height: 20),
            HorizontalCalendar(
              onDateSelected: (selectedDate) {
                controller.changeSelectedDate(selectedDate);
              },
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Obx(() {
                final filteredTasks = controller.tasksForSelectedDate;
                if (filteredTasks.isEmpty) {
                  return const Center(
                    child: Text(
                      'No projects or tasks for this date.\nTap + to add one!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: filteredTasks.length,
                  itemBuilder: (context, index) {
                    final task = filteredTasks[index];
                    
                    // Swipe-to-delete action wrapper
                    return Dismissible(
                      key: Key(task.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        margin: const EdgeInsets.only(bottom: 14),
                        decoration: BoxDecoration(
                          color: Colors.redAccent.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.delete, color: Colors.white, size: 28),
                      ),
                      onDismissed: (_) {
                        controller.deleteTask(task.id);
                        Get.snackbar('Deleted', 'Task removed successfully',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.white,
                            duration: const Duration(seconds: 2));
                      },
                      child: _buildTaskCard(task),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6338E1),
        shape: const CircleBorder(),
        onPressed: () {
          Get.to(() => const AddProjecttaskView());
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  Widget _buildTaskCard(TaskModel task) {
    // Determine if task is completed ('Done')
    bool isDone = task.status.toLowerCase() == 'done';

    return GestureDetector(
      onTap: () {
        Get.to(() => const AddProjecttaskView(), arguments: task);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.card_travel, size: 12, color: Colors.pinkAccent),
                      const SizedBox(width: 4),
                      Text(
                        task.status,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 14, color: Color(0xFF6338E1)),
                    const SizedBox(width: 4),
                    Text(
                      task.time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6338E1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDone ? Colors.grey : Colors.black87,
                          decoration: isDone ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      if (task.category.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          task.category,
                          style: TextStyle(
                            fontSize: 12, 
                            color: isDone ? Colors.grey.shade400 : Colors.grey,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // Interactive Complete / Toggle Button
                GestureDetector(
                  onTap: () {
                    // Toggle status between 'Done' and previous status
                    final newStatus = isDone ? 'To-do' : 'Done';
                    final updatedTask = TaskModel(
                      id: task.id,
                      title: task.title,
                      category: task.category,
                      time: task.time,
                      status: newStatus,
                      date: task.date,
                    );
                    controller.updateTask(updatedTask);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDone ? const Color(0xFF6338E1) : Colors.transparent,
                      border: Border.all(
                        color: isDone ? const Color(0xFF6338E1) : Colors.grey.shade400,
                        width: 2,
                      ),
                    ),
                    child: isDone
                        ? const Icon(Icons.check, size: 16, color: Colors.white)
                        : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}