import 'package:get/get.dart';

import '../controllers/td_controller/add_projecttask_controller.dart';

class AddProjecttaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProjecttaskController>(
      () => AddProjecttaskController(),
    );
  }
}
