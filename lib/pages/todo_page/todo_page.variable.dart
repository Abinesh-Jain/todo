import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../models/todo.dart';

mixin TodoPageVariable {
  RxList<Todo> todos = <Todo>[].obs;
  Box? box;
}
