import 'package:get/get.dart';

import '../controllers/todaytask_controller.dart';

class TodaytaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodaytaskController>(
      () => TodaytaskController(),
    );
  }
}
