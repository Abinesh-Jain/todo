import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/pages/todo_page/todo_page.controller.dart';

class TodoPageView extends GetResponsiveView<TodoPageController> {
  TodoPageView({super.key});

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo')),
      body: Obx(
        () => controller.todos.isEmpty
            ? const Center(
                child: Text('No tasks added !'),
              )
            : ListView.builder(
                itemCount: controller.todos.length,
                itemBuilder: (context, index) {
                  final todo = controller.todos[index];
                  return ListTile(
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (value) => controller.markAsDone(index),
                      tristate: true,
                    ),
                    title: Text('${todo.task}'),
                    onLongPress: () => showEdidTaskDialog(index),
                    trailing: IconButton(
                      onPressed: () => controller.deleteTodo(index),
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  void showEdidTaskDialog(int index) {
    final todo = controller.todos[index];
    String? task = todo.task;
    Get.defaultDialog(
        title: 'Edit Task',
        content: TextField(
          autofocus: true,
          controller: TextEditingController(text: task),
          onChanged: (value) => task = value,
          onSubmitted: (value) =>
              controller.editTodo(Todo(task: task, isDone: todo.isDone), index),
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              controller.editTodo(todo, index);
              Get.back();
            },
            child: const Text('Save'),
          ),
        ]);
  }

  void showAddTaskDialog() {
    String todo = '';
    Get.defaultDialog(
        title: 'Add Task',
        content: TextField(
          autofocus: true,
          onChanged: (value) => todo = value,
          onSubmitted: (value) {
            controller.addTodo(todo);
            Get.back();
          },
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              controller.addTodo(todo);
              Get.back();
            },
            child: const Text('Save'),
          )
        ]);
  }
}
