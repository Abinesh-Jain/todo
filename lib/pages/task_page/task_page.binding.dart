import 'package:get/get.dart';

import 'task_page.controller.dart';

class TaskPageBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<TaskPageController>(() => TaskPageController());
}
