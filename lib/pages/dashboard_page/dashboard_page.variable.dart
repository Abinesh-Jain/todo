import 'package:get/get.dart';

import '../../models/task.dart';

mixin DashboardPageVariable {
  RxList<Task> tasks = <Task>[].obs;
}
