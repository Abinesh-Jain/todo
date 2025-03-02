import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/school.dart';
import '../../models/task.dart';

mixin TaskCommencementPageVariable {
  Task? task;
  TextEditingController nameOfTheArea = TextEditingController();
  TextEditingController totalNoOfSchools = TextEditingController();
  GlobalKey<FormState> generalDataForm = GlobalKey<FormState>();
  GlobalKey<FormState> schoolOverviewForm = GlobalKey<FormState>();
  Rx<int?> page = Rx(null);
  RxList<School> schools = <School>[].obs;
}
