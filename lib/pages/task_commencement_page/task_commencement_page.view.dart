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
      appBar: AppBar(title: const Text(Strings.taskCommencement)),
      body: Obx(() => Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Get.theme.primaryColor,
                  child: Column(
                    children: [
                      ListTile(
                        selected: controller.page.value == null,
                        title: const Text(Strings.generalData),
                        onTap: () => controller.selectPage(0),
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: controller.schools.length,
                          itemBuilder: (_, index) => ListTile(
                            selected: controller.page.value == index,
                            title: Text('${Strings.school} ${index + 1}'),
                            onTap: () => controller.selectPage(index),
                          ),
                          separatorBuilder: (_, index) => const Divider(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: controller.page.value == null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: controller.generalDataForm,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(Strings.nameOfTheArea),
                                  TextFormField(
                                    controller: controller.nameOfTheArea,
                                    validator:
                                        controller.nameOfTheAreaValidator,
                                  ),
                                ].map((e) => Expanded(child: e)).toList(),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(Strings.totalNoOfSchools),
                                  TextFormField(
                                    controller: controller.totalNoOfSchools,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: const InputDecoration(
                                      hintText: Strings.max5Schools,
                                    ),
                                    maxLength: 1,
                                    validator:
                                        controller.numberOfSchoolsValidator,
                                  ),
                                ].map((e) => Expanded(child: e)).toList(),
                              ),
                              ElevatedButton(
                                onPressed: controller.onAddDataPressed,
                                child: const Text(Strings.addData),
                              )
                            ],
                          ),
                        ),
                      )
                    : Form(
                        key: controller.schoolOverviewForm,
                        child: SchoolOverview(
                          key: ValueKey(
                            controller.schools[controller.page.value!],
                          ),
                          school: controller.schools[controller.page.value!],
                          onFinishPressed: controller.onFinishPressed,
                        ),
                      ),
              ),
            ],
          )),
    );
  }
}
