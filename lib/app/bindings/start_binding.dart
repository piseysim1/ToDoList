import 'package:get/get.dart';

import '../controllers/td_controller/start_controller.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartController>(
      () => StartController(),
    );
  }
}
