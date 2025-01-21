import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/pages/todo_page/todo_page.variable.dart';

class TodoPageController extends GetxController with TodoPageVariable {
  @override
  void onInit() async {
    super.onInit();
    box = await Hive.openBox('todo');
    if (box != null) {
      todos.addAll(box!.values.map((e) => Todo.fromJson(e)).toList());
      update();
    }
  }

  void addTodo(String todo) {
    todos.add(Todo(
      task: todo,
      isDone: false,
    ));
    update();
    box!.put(todos.length - 1, todos.last.toJson());
  }

  void markAsDone(int index) {
    final isDone = todos[index].isDone;
    final newTodo = Todo(
      task: todos[index].task,
      isDone: isDone != null ? !isDone : true,
    );
    todos[index] = newTodo;
    box!.put(index, newTodo.toJson());
    update();
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
    update();
    box!.deleteAt(index);
  }

  void editTodo(Todo todo, int index) {
    todos[index] = todo;
    box!.put(index, todo.toJson());
    update();
  }
}
