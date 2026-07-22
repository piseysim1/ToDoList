// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:todolist_app/app/controllers/td_controller/add_projecttask_controller.dart';

// void ShowAddTaskDialog(BuildContext context) {
//   final AddProjecttaskController controller =
//       Get.find<AddProjecttaskController>();
//   Get.bottomSheet(
//     Container(
//       padding: const EdgeInsets.all(25),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text(
//             "Add Task",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 20),
//           TextField(
//             controller: controller.nameController,
//             decoration: InputDecoration(
//               hintText: "Name",
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//             ),
//           ),
//           const SizedBox(height: 30),
//           TextField(
//             controller: controller.descriptionController,
//             decoration: InputDecoration(
//               hintText: "Description",
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//             ),
//           ),
//           const SizedBox(height: 30),
//           SizedBox(
//             width: double.infinity,
//             height: 55,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF7B4DFF),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//               onPressed: () => controller.SaveTask(),
//               child: const Text(
//                 "Add",
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//     isScrollControlled: true,
//   );
// }
