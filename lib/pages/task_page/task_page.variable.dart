import 'package:flutter/material.dart';

import '../../models/task.dart';

mixin TaskPageVariable {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Task? task;
}
