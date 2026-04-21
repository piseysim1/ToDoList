import 'package:get/get.dart';

import '../modules/add_projecttask/bindings/add_projecttask_binding.dart';
import '../modules/add_projecttask/views/add_projecttask_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/start/bindings/start_binding.dart';
import '../modules/start/views/start_view.dart';
import '../modules/todaytask/bindings/todaytask_binding.dart';
import '../modules/todaytask/views/todaytask_view.dart';

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
