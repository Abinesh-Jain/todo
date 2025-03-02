import 'package:get/get.dart';

import 'task_commencement_page.controller.dart';

class TaskCommencementPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => TaskCommencementPageController());
}
