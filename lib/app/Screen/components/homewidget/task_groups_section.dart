import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/Screen/components/homewidget/group_style.dart';
import 'package:todolist_app/app/Screen/components/homewidget/taskProject.dart';
import 'package:todolist_app/app/controllers/td_controller/todaytask_controller.dart';

class TaskGroupsSection extends GetView<TodaytaskController> {
  const TaskGroupsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final summaries = controller.taskGroupSummaries;

      if (summaries.isEmpty) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            'Add Task to See group task.',
            style: TextStyle(color: Colors.grey),
          ),
        );
      }

      return Column(
        children: [
          for (int i = 0; i < summaries.length; i++) ...[
            if (i > 0) const SizedBox(height: 30),
            Builder(
              builder: (_) {
                final summary = summaries[i];
                final style = GroupStyle.styleFor(summary.title, i);
                final percentText =
                    '${(summary.progress * 100).round()}%';

                return Taskproject(
                  bgvalues: style.bg,
                  title: summary.title,
                  subTitle: '${summary.taskCount} Tasks',
                  iconTaskgroup: style.icon,
                  bgIcon: style.iconBg,
                  iconColor: style.iconColor,
                  values: summary.progress,
                  valuesColor: style.progressColor,
                  textPercent: percentText,
                );
              },
            ),
          ],
          const SizedBox(height: 30),
        ],
      );
    });
  }
}