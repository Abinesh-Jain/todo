import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/date_form_field.dart';
import '../../components/slider_form_field.dart';
import '../../models/task.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import 'task_page.controller.dart';

class TaskPageView extends GetResponsiveView<TaskPageController> {
  TaskPageView({super.key});

  @override
  Widget? builder() {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.createTask)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: controller.formKey,
              child: Flexible(
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: controller.task?.title,
                            decoration: const InputDecoration(
                              label: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: Strings.title),
                                    TextSpan(
                                      text: ' *',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              final task = controller.task ?? Task();
                              final newTask = task.copyWith(title: value);
                              controller.task = newTask;
                            },
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return '${Strings.title} ${Strings.isRequired}';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  value: controller.task?.assignTo,
                                  items: Constants.assignees
                                      .map((assignee) => DropdownMenuItem(
                                            value: assignee,
                                            child: Text(assignee),
                                          ))
                                      .toList(),
                                  decoration: const InputDecoration(
                                    label: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(text: Strings.assignTo),
                                          TextSpan(
                                            text: ' *',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    final task = controller.task ?? Task();
                                    task.copyWith(assignTo: value);
                                    controller.task = task;
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return '${Strings.assignTo} ${Strings.isRequired}';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: DropdownButtonFormField(
                                  value: controller.task?.priority,
                                  items: Constants.priorities
                                      .map((priority) => DropdownMenuItem(
                                            value: priority,
                                            child: Text(priority),
                                          ))
                                      .toList(),
                                  decoration: const InputDecoration(
                                    label: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(text: Strings.priority),
                                          TextSpan(
                                            text: ' *',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    final task = controller.task ?? Task();
                                    task.copyWith(priority: value);
                                    controller.task = task;
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return '${Strings.priority} ${Strings.isRequired}';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  initialValue: controller.task?.createdBy,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    label: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(text: Strings.creaetedBy),
                                          TextSpan(
                                            text: ' *',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    final task = controller.task ?? Task();
                                    task.copyWith(createdBy: value);
                                    controller.task = task;
                                  },
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return '${Strings.creaetedBy} ${Strings.isRequired}';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  initialValue: controller.task?.division,
                                  decoration: const InputDecoration(
                                    label: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(text: Strings.division),
                                          TextSpan(
                                            text: ' *',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    final task = controller.task ?? Task();
                                    task.copyWith(division: value);
                                    controller.task = task;
                                  },
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return '${Strings.division} ${Strings.isRequired}';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: TextFormField(
                              initialValue: controller.task?.description,
                              decoration: const InputDecoration(
                                filled: true,
                                label: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: Strings.description),
                                      TextSpan(
                                        text: ' *',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                alignLabelWithHint: true,
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return '${Strings.description} ${Strings.isRequired}';
                                }
                                return null;
                              },
                              maxLines: null,
                              expands: true,
                              keyboardType: TextInputType.multiline,
                              textAlignVertical: TextAlignVertical.top,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          DropdownButtonFormField(
                            value: controller.task?.taskStatus,
                            items: Constants.statuses
                                .map((status) => DropdownMenuItem(
                                      value: status,
                                      child: Text(status),
                                    ))
                                .toList(),
                            decoration: const InputDecoration(
                              label: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: Strings.taskStatus),
                                    TextSpan(
                                      text: ' *',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onChanged: (value) {},
                            validator: (value) {
                              if (value == null) {
                                return '${Strings.taskStatus} ${Strings.isRequired}';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          SliderFormField(
                            initialValue: controller.task?.complete,
                            label: Strings.complete,
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField(
                            value: controller.task?.group,
                            items: Constants.groups
                                .map((group) => DropdownMenuItem(
                                      value: group,
                                      child: Text(group),
                                    ))
                                .toList(),
                            decoration: const InputDecoration(
                              label: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: Strings.group),
                                    TextSpan(
                                      text: ' *',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onChanged: (value) {},
                            validator: (value) {
                              if (value == null) {
                                return '${Strings.group} ${Strings.isRequired}';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          DateFormField(
                            initialValue: controller.task?.startDate,
                            label: Strings.startDate,
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 10),
                          DateFormField(
                            initialValue: controller.task?.dueDate,
                            label: Strings.dueDate,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const RoundedRectangleBorder(),
                  ),
                  onPressed: controller.onSavePressed,
                  child: const Text(
                    Strings.save,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: const RoundedRectangleBorder(),
                  ),
                  onPressed: Get.back,
                  child: const Text(
                    Strings.cancel,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
