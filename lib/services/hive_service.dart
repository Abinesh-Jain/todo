import 'package:hive/hive.dart';
import '../config/app_boxes.dart';
import '../models/task.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();
  late Box _taskBox;

  factory HiveService() => _instance;

  HiveService._internal();

  Future<void> init() async {
    _taskBox = await Hive.openBox(AppBoxes.tasks);
  }

  List<Task> getTasks() {
    return _taskBox.keys.map((key) {
      final value = _taskBox.get(key);
      return Task.fromJSON(value).copyWith(id: '$key');
    }).toList();
  }

  Future<int> addTask(Task task) => _taskBox.add(task.toJSON());

  void updateTask(dynamic key, Task task) => _taskBox.put(key, task.toJSON());

  void deleteTask(dynamic key) => _taskBox.delete(key);
}
