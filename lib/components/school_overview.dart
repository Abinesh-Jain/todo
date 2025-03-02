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
  });

  final School school;

  final VoidCallback? onFinishPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextFormField(
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
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField(
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
          ),
          const SizedBox(height: 10),
          ChipsFormField(
            options: Constants.curriculums,
            label: Strings.curriculum,
          ),
          const SizedBox(height: 10),
          DateFormField(
            label: Strings.establishedOn,
          ),
          const SizedBox(height: 10),
          ChipsFormField(
            options: Constants.grades,
            label: Strings.gradesPresentInTheSchool,
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
