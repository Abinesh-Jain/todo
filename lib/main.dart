import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'src/app.dart';

void main() {
  Hive.initFlutter();
  runApp(const App());
}
