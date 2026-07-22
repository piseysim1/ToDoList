// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:todolist_app/app/controllers/td_controller/task_controller.dart';
// import 'package:todolist_app/app/data/models/taskModel.model.dart';

// class ListTask extends StatelessWidget {

//   final TaskController controller = Get.find<TaskController>();
//   ListTask({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => ListView.builder(
//         shrinkWrap:
//             true, 
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: controller.tasks.length,
//         itemBuilder: (context, index) {
//           return _buildTaskItem(controller.tasks[index]);
//         },
//       ),
//     );
//   }
//   Widget _buildTaskItem(TaskModel task) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             task.name,
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           Container(
//             width: 24,
//             height: 24,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.grey.shade400),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }