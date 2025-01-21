class Todo {
  final String? task;
  final bool? isDone;

  Todo({this.task, this.isDone});

  Todo.fromJson(Map json)
      : task = json['task'],
        isDone = json['isDone'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['task'] = task;
    data['isDone'] = isDone;
    return data;
  }
}
