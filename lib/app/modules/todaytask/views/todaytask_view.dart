import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/todaytask_controller.dart';

class TodaytaskView extends GetView<TodaytaskController> {
  const TodaytaskView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodaytaskView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TodaytaskView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
