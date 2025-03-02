import 'package:get/get.dart';
import 'package:todo/models/task.dart';

import '../../src/routes.dart';
import '../../utils/constants.dart';
import 'dashboard_page.variable.dart';

class DashboardPageController extends GetxController
    with DashboardPageVariable {
  @override
  void onInit() {
    super.onInit();
    tasks.value = List.generate(
        5,
        (index) => Task(
              id: '$index',
              title: 'Task $index',
              description: 'Description for Task $index',
              assignTo: Constants.assignees[index % Constants.assignees.length],
              priority:
                  Constants.priorities[index % Constants.priorities.length],
              taskStatus: Constants.statuses[index % Constants.statuses.length],
              complete: index.toDouble(),
              createdBy: 'User $index',
              division: 'Division $index',
              startDate: DateTime.now(),
              dueDate: DateTime.now(),
              group: Constants.groups[index % Constants.groups.length],
            ));
  }

  void onStartTaskPressed(int index) {
    Get.toNamed(
      Routes.taskCommencement,
      arguments: tasks[index],
    );
  }

  void onAddTaskPressed() {
    Get.toNamed(Routes.task)?.then((value) {
      if (value is Task) {
        tasks.add(value);
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
        }
      },
    );
  }

  void onDeleteTaskPressed(int index) {
    Get.defaultDialog(
      title: 'Delete Task',
      middleText: 'Are you sure you want to delete this task ?',
      textConfirm: 'Yes',
      textCancel: 'No',
      onConfirm: () {
        tasks.removeAt(index);
        Get.back();
      },
    );
  }
}
