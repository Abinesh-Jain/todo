import 'package:get/get.dart';

import '../../models/task.dart';
import '../../models/user.dart';
import '../../services/auth_service.dart';
import '../../services/hive_service.dart';

mixin DashboardPageVariable {
  RxInt category = 0.obs;
  User? user;
  RxList<Task> tasks = <Task>[].obs;
  HiveService hive = HiveService();
  AuthService auth = AuthService();
}
