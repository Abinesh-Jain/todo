import 'package:flutter/material.dart';
import '../utils/strings.dart';
import 'required_star.dart';

class ChipsFormField<T> extends StatelessWidget {
  const ChipsFormField({
    super.key,
    this.options = const [],
    this.label,
    this.initialValue,
    this.required = true,
    this.onSaved,
  });

  final List<T>? initialValue;
  final String? label;
  final List<T> options;
  final bool required;
  final FormFieldSetter<List<T>>? onSaved;

  @override
  Widget build(BuildContext context) {
    return FormField<List<T>>(
      initialValue: initialValue ?? [],
      validator: (value) {
        if (required && (value == null || value.isEmpty)) {
          return '$label ${Strings.isRequired}';
        }
        return null;
      },
      builder: (field) => InputDecorator(
        decoration: InputDecoration(
          label: RichText(
            text: TextSpan(
              text: label ?? '',
              style: Theme.of(context).inputDecorationTheme.labelStyle,
              children: required ? [RequiredStar()] : [],
            ),
          ),
          errorText: field.errorText,
        ),
        child: Wrap(
          spacing: 8.0,
          children: options
              .map((option) => ChoiceChip(
                    label: Text('$option'),
                    selected: field.value?.contains(option) ?? false,
                    onSelected: (value) {
                      final selected = [...?field.value];
                      if (value) {
                        selected.add(option);
                      } else {
                        selected.remove(option);
                      }
                      field.didChange(selected);
                    },
                  ))
              .toList(),
        ),
      ),
      onSaved: onSaved,
    );
  }
}
