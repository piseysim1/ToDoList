import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/Screen/components/homewidget/group_style.dart';
import 'package:todolist_app/app/Screen/components/homewidget/project_card.dart';
import 'package:todolist_app/app/controllers/td_controller/todaytask_controller.dart';

class InProgressSection extends GetView<TodaytaskController> {
  const InProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final recentTasks = controller.tasks.reversed.take(2).toList();

      if (recentTasks.isEmpty) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            'No projects yet ',
            style: TextStyle(color: Colors.grey),
          ),
        );
      }

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < recentTasks.length; i++) ...[
              if (i > 0) const SizedBox(width: 20),
              Builder(
                builder: (_) {
                  final task = recentTasks[i];
                  final style = GroupStyle.styleFor(task.status, i);
                  final total = task.subTasks.length;
                  final done = task.subTasks
                      .where((s) => s.isCompleted)
                      .length;
                  final progress = total == 0 ? 0.0 : done / total;

                  return ProjectCard(
                    category: task.status,
                    title: task.title,
                    progress: progress,
                    backgroundColor: style.bg,
                    progressColor: style.progressColor,
                    icon: style.icon,
                  );
                },
              ),
            ],
          ],
        ),
      );
    });
  }
}