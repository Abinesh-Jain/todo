import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/school.dart';
import '../../models/task.dart';
import '../../services/hive_service.dart';

mixin TaskCommencementPageVariable {
  Task? task;
  TextEditingController nameOfTheArea = TextEditingController();
  TextEditingController totalNoOfSchools = TextEditingController();
  GlobalKey<FormState> generalDataForm = GlobalKey<FormState>();
  GlobalKey<FormState> schoolOverviewForm = GlobalKey<FormState>();
  Rx<int?> page = Rx(null);
  RxList<School> schools = <School>[].obs;
  HiveService hive = HiveService();
}
