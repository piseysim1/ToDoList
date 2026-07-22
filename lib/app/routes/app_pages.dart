import 'package:get/get.dart';
import 'package:todolist_app/app/Screen/ui/mainscreen.dart';
import 'package:todolist_app/app/Screen/ui/todaytask/TodaytaskView.dart';
import '../bindings/add_projecttask_binding.dart';
import '../Screen/ui/add_projecttask/add_projecttask_view.dart';
import '../bindings/home_binding.dart';
import '../Screen/ui/home/home_view.dart';
import '../bindings/login_binding.dart';
import '../Screen/ui/login/login_view.dart';
import '../bindings/signup_binding.dart';
import '../Screen/ui/signup/signup_view.dart';
import '../bindings/start_binding.dart';
import '../Screen/ui/start/start_view.dart';
import '../bindings/todaytask_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.START;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const Mainscreen(),
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
