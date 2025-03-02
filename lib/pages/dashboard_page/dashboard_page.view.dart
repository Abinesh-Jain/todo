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
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(child: Text(Strings.home)),
              const PopupMenuItem(child: Text(Strings.settings)),
              PopupMenuItem(
                onTap: controller.logout,
                child: const Text(Strings.logout),
              ),
            ],
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Obx(() => Row(
            children: [
              Expanded(
                flex: 2,
                child: Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        color: Get.theme.primaryColor,
                        child: Text(
                          Strings.taskCategories,
                          style: Get.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(8),
                          children: [
                            ListTile(
                              selected: controller.category.value == 0,
                              title: const Text(Strings.scheduledTasks),
                              leading: const Icon(Icons.schedule),
                              onTap: () => controller.onCategorySelected(0),
                            ),
                            ListTile(
                              selected: controller.category.value == 1,
                              title: const Text(Strings.completedTasks),
                              leading: const Icon(Icons.check_circle),
                              onTap: () => controller.onCategorySelected(1),
                            ),
                            ListTile(
                              selected: controller.category.value == 2,
                              title: const Text(Strings.withHeldTasks),
                              leading: const Icon(Icons.pause_circle),
                              onTap: () => controller.onCategorySelected(2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Strings.taskOverview,
                              style: Get.textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                ElevatedButton.icon(
                                  onPressed: controller.onAddTaskPressed,
                                  icon: const Icon(Icons.add),
                                  label: const Text(Strings.addTask),
                                ),
                                ElevatedButton.icon(
                                  onPressed: controller.refreshTasks,
                                  icon: const Icon(Icons.refresh),
                                  label: const Text(Strings.refreshTasks),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: controller.tasks.isEmpty
                            ? Center(
                                child: Text(
                                  Strings.noTasksAvailable,
                                  style: Get.textTheme.bodyLarge,
                                ),
                              )
                            : ListView.separated(
                                padding: const EdgeInsets.all(8),
                                itemCount: controller.tasks.length,
                                itemBuilder: (context, index) {
                                  final task = controller.tasks[index];
                                  return Card(
                                    elevation: 3,
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                      title: Text(
                                        task.title ?? Strings.untitledTask,
                                        style: Get.textTheme.titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(task.description ?? ""),
                                      trailing: Wrap(
                                        spacing: 8,
                                        children: [
                                          IconButton(
                                            onPressed: () => controller
                                                .onStartTaskPressed(index),
                                            icon: const Icon(Icons.play_arrow),
                                            tooltip: Strings.start,
                                          ),
                                          IconButton(
                                            onPressed: () => controller
                                                .onEditTaskPressed(index),
                                            icon: const Icon(Icons.edit),
                                            tooltip: Strings.editTask,
                                          ),
                                          IconButton(
                                            onPressed: () => controller
                                                .onDeleteTaskPressed(index),
                                            icon: const Icon(Icons.delete,
                                                color: Colors.red),
                                            tooltip: Strings.deleteTask,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (_, index) =>
                                    const SizedBox(height: 5),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
