import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/strings.dart';
import 'dashboard_page.controller.dart';

class DashboardPageView extends GetResponsiveView<DashboardPageController> {
  DashboardPageView({super.key});

  @override
  Widget? builder() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.dashboard),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Get.theme.primaryColor,
              padding: const EdgeInsets.all(10),
              child: const Column(
                children: [
                  ListTile(
                    title: Text(Strings.scheduledTasks),
                    selected: true,
                  ),
                  ListTile(title: Text(Strings.completedTasks)),
                  ListTile(title: Text(Strings.withHeldTasks)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: controller.onAddTaskPressed,
                      icon: const Icon(Icons.add),
                      label: const Text(Strings.addTask),
                    ),
                  ],
                ),
                Expanded(
                  child: Obx(() => controller.tasks.isEmpty
                      ? const Center(child: Text(Strings.noTasksAvailable))
                      : ListView.separated(
                          padding: const EdgeInsets.all(10),
                          itemCount: controller.tasks.length,
                          itemBuilder: (context, index) {
                            final task = controller.tasks[index];
                            return ListTile(
                              title: Text('${task.title}'),
                              subtitle: Text('${task.description}'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () =>
                                        controller.onStartTaskPressed(index),
                                    icon: const Icon(Icons.start),
                                    tooltip: Strings.start,
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        controller.onEditTaskPressed(index),
                                    icon: const Icon(Icons.edit),
                                    tooltip: Strings.editTask,
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        controller.onDeleteTaskPressed(index),
                                    icon: const Icon(Icons.delete),
                                    tooltip: Strings.deleteTask,
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (_, index) =>
                              const Divider(height: 1),
                        )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
