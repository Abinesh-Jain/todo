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

  /// The function `onCategorySelected` updates the list of tasks based on the selected category index.
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

  /// The `onStartTaskPressed` function navigates to the task commencement screen with the selected task
  /// and refreshes the tasks upon completion.
  void onStartTaskPressed(int index) {
    Get.toNamed(
      Routes.taskCommencement,
      arguments: tasks[index],
    )?.then((value) => refreshTasks());
  }

  /// The `refreshTasks` function updates the tasks list with data from Hive and resets the category value
  /// to 0.
  void refreshTasks() {
    tasks.value = hive.getTasks();
    category.value = 0;
  }

  /// This function navigates to the task screen, passes the user's name as an argument, and adds the
  /// created task to the list of tasks and a Hive database.
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

  /// The `onEditTaskPressed` function navigates to the task screen, updates the task if a new task is
  /// returned, and updates the task in a Hive database.
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

  /// The `onDeleteTaskPressed` function displays a confirmation dialog to delete a task and removes it
  /// from the list of tasks if confirmed.
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

  /// The `logout` function displays a confirmation dialog and logs the user out if confirmed.
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
