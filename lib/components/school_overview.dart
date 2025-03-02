import 'package:flutter/material.dart';

import '../models/school.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import 'chips_form_field.dart';
import 'date_form_field.dart';
import 'required_star.dart';

class SchoolOverview extends StatelessWidget {
  const SchoolOverview({
    super.key,
    required this.school,
    this.onFinishPressed,
    this.onChanged,
    this.onSaved,
  });

  final School school;

  final VoidCallback? onFinishPressed;

  final ValueChanged<School>? onChanged;

  final FormFieldSetter<School>? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextFormField(
            initialValue: school.name,
            decoration: InputDecoration(
              label: RichText(
                text: TextSpan(
                    text: Strings.nameOfTheSchool,
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                    children: [RequiredStar()]),
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return '${Strings.nameOfTheSchool} ${Strings.isRequired}';
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              final newSchool = school.copyWith(name: newValue);
              onSaved?.call(newSchool);
            },
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField(
            value: school.type,
            items: Constants.schoolTypes
                .map((type) => DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    ))
                .toList(),
            decoration: InputDecoration(
              label: RichText(
                text: TextSpan(
                  text: Strings.typeOfTheSchool,
                  style: Theme.of(context).inputDecorationTheme.labelStyle,
                  children: [RequiredStar()],
                ),
              ),
            ),
            onChanged: (value) {},
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return '${Strings.nameOfTheSchool} ${Strings.isRequired}';
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              final newSchool = school.copyWith(type: newValue);
              onSaved?.call(newSchool);
            },
          ),
          const SizedBox(height: 10),
          ChipsFormField(
            initialValue: school.curriculum,
            options: Constants.curriculums,
            label: Strings.curriculum,
            onSaved: (newValue) {
              final newSchool = school.copyWith(curriculum: newValue);
              onSaved?.call(newSchool);
            },
          ),
          const SizedBox(height: 10),
          DateFormField(
            initialValue: school.establishedOn,
            label: Strings.establishedOn,
            onSaved: (newValue) {
              final newSchool = school.copyWith(establishedOn: newValue);
              onSaved?.call(newSchool);
            },
          ),
          const SizedBox(height: 10),
          ChipsFormField(
            initialValue: school.grades,
            options: Constants.grades,
            label: Strings.gradesPresentInTheSchool,
            onSaved: (newValue) {
              final newSchool = school.copyWith(grades: newValue);
              onSaved?.call(newSchool);
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: onFinishPressed,
            child: const Text(Strings.finish),
          )
        ],
      ),
    );
  }
}
