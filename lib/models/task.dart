import 'general_data.dart';

class Task {
  final String? id;
  final String? title;
  final String? assignTo;
  final String? priority;
  final String? createdBy;
  final String? division;
  final String? description;
  final String? taskStatus;
  final double? complete;
  final String? group;
  final DateTime? startDate;
  final DateTime? dueDate;
  final GeneralData generalData;

  Task({
    this.id,
    this.title,
    this.assignTo,
    this.priority,
    this.createdBy,
    this.division,
    this.description,
    this.taskStatus,
    this.complete,
    this.group,
    this.startDate,
    this.dueDate,
    this.generalData = const GeneralData(),
  });

  factory Task.fromJSON(json) => Task(
        id: json['id'] as String?,
        title: json['title'] as String?,
        assignTo: json['assignTo'] as String?,
        priority: json['priority'] as String?,
        createdBy: json['createdBy'] as String?,
        division: json['division'] as String?,
        description: json['description'] as String?,
        taskStatus: json['taskStatus'] as String?,
        complete: (json['complete'] as num?)?.toDouble(),
        group: json['group'] as String?,
        startDate: json['startDate'] != null
            ? DateTime.tryParse(json['startDate'])
            : null,
        dueDate:
            json['dueDate'] != null ? DateTime.tryParse(json['dueDate']) : null,
        generalData: json['generalData'] != null
            ? GeneralData.fromJSON(json['generalData'])
            : const GeneralData(),
      );

  Task copyWith({
    String? id,
    String? title,
    String? assignTo,
    String? priority,
    String? createdBy,
    String? division,
    String? description,
    String? taskStatus,
    double? complete,
    String? group,
    DateTime? startDate,
    DateTime? dueDate,
    GeneralData? generalData,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        assignTo: assignTo ?? this.assignTo,
        priority: priority ?? this.priority,
        createdBy: createdBy ?? this.createdBy,
        division: division ?? this.division,
        description: description ?? this.description,
        taskStatus: taskStatus ?? this.taskStatus,
        complete: complete ?? this.complete,
        group: group ?? this.group,
        startDate: startDate ?? this.startDate,
        dueDate: dueDate ?? this.dueDate,
        generalData: generalData ?? this.generalData,
      );

  Map<String, dynamic> toJSON() => {
        'id': id,
        'title': title,
        'assignTo': assignTo,
        'priority': priority,
        'createdBy': createdBy,
        'division': division,
        'description': description,
        'taskStatus': taskStatus,
        'complete': complete,
        'group': group,
        'startDate': startDate?.toString(),
        'dueDate': dueDate?.toString(),
        'generalData': generalData.toJSON(),
      };
}
