import 'package:get/get.dart';

import 'dashboard_page.controller.dart';

class DashboardPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => DashboardPageController());
}
