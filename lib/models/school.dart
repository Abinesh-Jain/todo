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
}
