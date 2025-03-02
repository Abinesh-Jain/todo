import 'package:get/get.dart';

import '../../models/task.dart';
import '../../src/routes.dart';
import 'dashboard_page.variable.dart';

class DashboardPageController extends GetxController
    with DashboardPageVariable {
  @override
  void onInit() async {
    super.onInit();
    await hive.init();
    tasks.value = hive.getTasks();
    auth.getUser().then((value) {
      user = value;
    });
  }

  void onCategorySelected(int index) {
    category.value = index;
    switch (index) {
      case 1:
        tasks.value =
            hive.getTasks().where((task) => task.complete == 100).toList();
        break;
      case 2:
        tasks.value = hive
            .getTasks()
            .where((task) => task.dueDate?.isBefore(DateTime.now()) ?? true)
            .toList();
        break;
      default:
        tasks.value = hive.getTasks();
    }
  }

  void onStartTaskPressed(int index) {
    Get.toNamed(
      Routes.taskCommencement,
      arguments: tasks[index],
    )?.then((value) => refreshTasks());
  }

  void refreshTasks() {
    tasks.value = hive.getTasks();
    category.value = 0;
  }

  void onAddTaskPressed() {
    Get.toNamed(
      Routes.task,
      arguments: Task(createdBy: user?.name),
    )?.then((value) {
      if (value is Task) {
        tasks.add(value);
        hive.addTask(value);
      }
    });
  }

  void onEditTaskPressed(int index) {
    Get.toNamed(
      Routes.task,
      arguments: tasks[index],
    )?.then(
      (value) {
        if (value is Task) {
          tasks[index] = value;
          hive.updateTask(int.tryParse('${value.id}'), value);
        }
      },
    );
  }

  void onDeleteTaskPressed(int index) {
    final task = tasks[index];
    Get.defaultDialog(
      title: 'Delete Task',
      middleText: 'Are you sure you want to delete this task ?',
      textConfirm: 'Yes',
      textCancel: 'No',
      onConfirm: () {
        tasks.removeAt(index);
        hive.deleteTask(int.tryParse('${task.id}'));
        Get.back();
      },
    );
  }

  void logout() {
    Get.defaultDialog(
      title: 'Logout ?',
      middleText: 'Are you sure you want to logout from the device ?',
      textConfirm: 'Yes',
      textCancel: 'No',
      onConfirm: () {
        Get.back();
        auth.logout().then((value) => Get.offAllNamed(Routes.login));
      },
    );
  }
}
