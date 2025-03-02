import 'package:get/get.dart';

import 'login_page.controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => LoginPageController());
}
