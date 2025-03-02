import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'task_page.variable.dart';

class TaskPageController extends GetxController with TaskPageVariable {
  @override
  void onInit() {
    super.onInit();
    task = Get.arguments;
  }

  void onSavePressed() {
    primaryFocus?.unfocus();
    final valid = formKey.currentState?.validate() ?? false;
    if (valid) {
      Get
        ..back(result: task)
        ..snackbar(
          'Saved successfully !',
          'Task saved successfully',
          backgroundColor: Colors.greenAccent,
          maxWidth: Get.width * 0.25,
        );
    } else {
      Get.snackbar(
        'Task not valid !',
        'Please correct the errors',
        backgroundColor: Colors.redAccent,
        maxWidth: Get.width * 0.25,
      );
    }
  }
}
