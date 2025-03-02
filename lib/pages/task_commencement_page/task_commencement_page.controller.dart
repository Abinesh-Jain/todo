import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/general_data.dart';
import '../../models/school.dart';
import '../../models/task.dart';
import '../../utils/strings.dart';
import 'task_commencement_page.variable.dart';

class TaskCommencementPageController extends GetxController
    with TaskCommencementPageVariable {
  @override
  void onInit() {
    super.onInit();
    task = Get.arguments;
    nameOfTheArea.text = task?.generalData.area ?? '';
    totalNoOfSchools.text = '${task?.generalData.numberOfSchools ?? 0}';
    schools.value = task?.generalData.schools ?? [];
  }

  void selectPage(int? value) => page.value = value;

  String? nameOfTheAreaValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '${Strings.nameOfTheArea} ${Strings.isRequired}';
    } else {
      return null;
    }
  }

  String? numberOfSchoolsValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '${Strings.totalNoOfSchools} ${Strings.isRequired}';
    }
    final count = int.tryParse(value) ?? 0;
    if (count == 0) {
      return '${Strings.atleast1School} ${Strings.isRequired}';
    }
    if (count > 5) return Strings.max5Schools;
    return null;
  }

  void onAddDataPressed() {
    primaryFocus?.unfocus();
    final valid = generalDataForm.currentState?.validate() ?? false;
    if (valid) {
      final count = int.tryParse(totalNoOfSchools.text) ?? 0;
      final newTask = (task ?? Task()).copyWith(
        generalData: GeneralData(
          area: nameOfTheArea.text,
          numberOfSchools: count,
          schools: List.generate(
            count,
            (index) => School(),
          ),
        ),
      );
      task = newTask;
      schools.value = newTask.generalData.schools ?? [];
      hive.updateTask(int.tryParse('${task?.id}'), task!);
      Get.snackbar('General data Added', 'Schools are added');
    } else {
      Get.snackbar('Error', 'Please check out the fields');
    }
  }

  void onFinishPressed() {
    primaryFocus?.unfocus();
    final valid = schoolOverviewForm.currentState?.validate() ?? false;
    if (valid) {
      schoolOverviewForm.currentState?.save();
      Get.snackbar('Form is Valid !', 'School updated');
    } else {
      Get.snackbar('Form is Invalid !', 'School not updated');
    }
  }

  void onSaved(School? school) {
    final selectedSchool = schools[page.value!];
    final newSchool = selectedSchool.copyWith(
      name: school?.name,
      type: school?.type,
      curriculum: school?.curriculum,
      establishedOn: school?.establishedOn,
      grades: school?.grades,
    );
    schools[page.value!] = newSchool;
    final validSchools = schools.where((school) => school.isValid);
    if (newSchool.grades != null && newSchool.grades!.isNotEmpty) {
      hive.updateTask(
        int.tryParse('${task?.id}'),
        task!.copyWith(
          generalData: task?.generalData.copyWith(
            schools: schools,
          ),
          complete: (validSchools.length / schools.length) * 100,
        ),
      );
    }
    if (schools.length == validSchools.length) Get.back();
  }
}
