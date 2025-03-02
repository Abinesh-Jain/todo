import 'package:get/get.dart';

import '../pages/dashboard_page/dashboard_page.binding.dart';
import '../pages/dashboard_page/dashboard_page.view.dart';
import '../pages/login_page/login_page.binding.dart';
import '../pages/login_page/login_page.view.dart';
import '../pages/task_commencement_page/task_commencement_page.binding.dart';
import '../pages/task_commencement_page/task_commencement_page.view.dart';
import '../pages/task_page/task_page.binding.dart';
import '../pages/task_page/task_page.view.dart';
import '../pages/todo_page/todo_page.binding.dart';
import '../pages/todo_page/todo_page.view.dart';

class Routes {
  static const String home = '/';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String task = '/task';
  static const String taskCommencement = '/task-commencement';

  static List<GetPage> getPages = [
    GetPage(
      name: dashboard,
      page: () => DashboardPageView(),
      binding: DashboardPageBinding(),
    ),
    GetPage(
      name: login,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: home,
      page: () => TodoPageView(),
      binding: TodoPageBinding(),
    ),
    GetPage(
      name: task,
      page: () => TaskPageView(),
      binding: TaskPageBinding(),
    ),
    GetPage(
      name: taskCommencement,
      page: () => TaskCommencementPageView(),
      binding: TaskCommencementPageBinding(),
    ),
  ];
}
