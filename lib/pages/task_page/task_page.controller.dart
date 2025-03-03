import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/task.dart';
import 'task_page.variable.dart';

class TaskPageController extends GetxController with TaskPageVariable {
  @override
  void onInit() {
    super.onInit();
    task = Get.arguments ?? Task();
  }

  /// The `onSavePressed` function unfocuses the primary focus, validates a form, and shows a success or
  /// error message using GetX in Dart.
  void onSavePressed() {
    primaryFocus?.unfocus();
    final valid = formKey.currentState?.validate() ?? false;
    if (valid) {
      Get
        ..back(result: task)
        ..snackbar('Saved successfully !', 'Task saved successfully');
    } else {
      Get.snackbar('Task not valid !', 'Please correct the errors');
    }
  }
}
