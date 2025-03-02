import 'school.dart';

class GeneralData {
  final String? area;
  final int? numberOfSchools;
  final List<School>? schools;

  const GeneralData({
    this.area,
    this.numberOfSchools,
    this.schools,
  });

  GeneralData copyWith({
    String? area,
    int? numberOfSchools,
    List<School>? schools,
  }) =>
      GeneralData(
        area: area ?? this.area,
        numberOfSchools: numberOfSchools ?? this.numberOfSchools,
        schools: schools ?? this.schools,
      );

  Map<String, dynamic> toJSON() => {
        'area': area,
        'numberOfSchools': numberOfSchools,
        'schools': schools?.map((school) => school.toJSON()).toList(),
      };
}
