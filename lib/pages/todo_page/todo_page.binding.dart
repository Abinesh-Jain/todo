import 'package:get/get.dart';

import 'todo_page.controller.dart';

class TodoPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoPageController>(() => TodoPageController());
  }
}
