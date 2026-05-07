import 'package:get/get.dart';

import '../bindings/add_projecttask_binding.dart';
import '../modules/screen/add_projecttask/add_projecttask_view.dart';
import '../bindings/home_binding.dart';
import '../modules/screen/home/home_view.dart';
import '../bindings/login_binding.dart';
import '../modules/screen/login/login_view.dart';
import '../bindings/signup_binding.dart';
import '../modules/screen/signup/signup_view.dart';
import '../bindings/start_binding.dart';
import '../modules/screen/start/start_view.dart';
import '../bindings/todaytask_binding.dart';
import '../modules/screen/todaytask/todaytask_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.START;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PROJECTTASK,
      page: () => const AddProjecttaskView(),
      binding: AddProjecttaskBinding(),
    ),
    GetPage(
      name: _Paths.TODAYTASK,
      page: () => const TodaytaskView(),
      binding: TodaytaskBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.START,
      page: () => const StartView(),
      binding: StartBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
  ];
}
