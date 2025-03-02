import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../components/school_overview.dart';
import '../../utils/strings.dart';
import 'task_commencement_page.controller.dart';

class TaskCommencementPageView
    extends GetResponsiveView<TaskCommencementPageController> {
  TaskCommencementPageView({super.key});

  @override
  Widget? builder() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.taskCommencement),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(child: Text(Strings.home)),
              const PopupMenuItem(child: Text(Strings.settings)),
              const PopupMenuItem(child: Text(Strings.logout)),
            ],
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Obx(() => Row(
            children: [
              // Sidebar for Navigation
              Expanded(
                flex: 2,
                child: Card(
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      ListTile(
                        selected: controller.page.value == null,
                        title: const Text(
                          Strings.generalData,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading:
                            const Icon(Icons.task, color: Colors.blueAccent),
                        onTap: () => controller.selectPage(null),
                      ),
                      const Divider(),
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: controller.schools.length,
                          itemBuilder: (_, index) => ListTile(
                            selected: controller.page.value == index,
                            title: Text(
                              '${Strings.school} ${index + 1}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            leading:
                                const Icon(Icons.school, color: Colors.green),
                            onTap: () => controller.selectPage(index),
                          ),
                          separatorBuilder: (_, index) => const Divider(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Main Content Area
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: controller.page.value == null
                      ? Form(
                          key: controller.generalDataForm,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(Strings.nameOfTheArea),
                              const SizedBox(height: 6),
                              TextFormField(
                                controller: controller.nameOfTheArea,
                                validator: controller.nameOfTheAreaValidator,
                              ),
                              const SizedBox(height: 16),
                              const Text(Strings.totalNoOfSchools),
                              const SizedBox(height: 6),
                              TextFormField(
                                controller: controller.totalNoOfSchools,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 1,
                                validator: controller.numberOfSchoolsValidator,
                                decoration: const InputDecoration(
                                  hintText: Strings.max5Schools,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton.icon(
                                  onPressed: controller.onAddDataPressed,
                                  icon: const Icon(Icons.add, size: 20),
                                  label: const Text(Strings.addData),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Form(
                          key: controller.schoolOverviewForm,
                          child: SchoolOverview(
                            key: ValueKey(
                                controller.schools[controller.page.value!]),
                            school: controller.schools[controller.page.value!],
                            onFinishPressed: controller.onFinishPressed,
                            onSaved: controller.onSaved,
                          ),
                        ),
                ),
              ),
            ],
          )),
    );
  }
}
