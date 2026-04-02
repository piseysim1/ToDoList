import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_projecttask_controller.dart';

class AddProjecttaskView extends GetView<AddProjecttaskController> {
  const AddProjecttaskView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddProjecttaskView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddProjecttaskView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
