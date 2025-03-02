class School {
  final String? name;
  final String? type;
  final List<String>? curriculum;
  final DateTime? establishedOn;
  final List<String>? grades;

  School({
    this.name,
    this.type,
    this.curriculum,
    this.establishedOn,
    this.grades,
  });

  factory School.fromJSON(json) => School(
        name: json?['name'],
        type: json?['type'],
        curriculum: json?['curriculum'],
        establishedOn: json?['establishedOn'] != null
            ? DateTime.tryParse('${json?['establishedOn']}')
            : null,
        grades: json?['grades'],
      );

  School copyWith({
    String? name,
    String? type,
    List<String>? curriculum,
    DateTime? establishedOn,
    List<String>? grades,
  }) =>
      School(
        name: name ?? this.name,
        type: type ?? this.type,
        curriculum: curriculum ?? this.curriculum,
        establishedOn: establishedOn ?? this.establishedOn,
        grades: grades ?? this.grades,
      );

  Map<String, dynamic> toJSON() => {
        'name': name,
        'type': type,
        'curriculum': curriculum,
        'establishedOn': establishedOn?.toString(),
        'grades': grades,
      };

  bool get isValid {
    final isNull = [name, type, curriculum, establishedOn, grades]
        .any((element) => element == null);
    if (isNull) return false;
    final isEmpty = [curriculum, grades].any((element) => element!.isEmpty);
    if (isEmpty) return false;
    return true;
  }
}
