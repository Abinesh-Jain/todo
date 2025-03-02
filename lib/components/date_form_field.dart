import 'package:flutter/material.dart';

import 'clear_button.dart';
import 'required_star.dart';

class DateFormField extends StatelessWidget {
  DateFormField({
    super.key,
    this.initialValue,
    this.label,
    this.onChanged,
    this.required = true,
  }) : controller = TextEditingController(
            text: initialValue != null
                ? initialValue.toLocal().toString().split(' ')[0]
                : '');

  final DateTime? initialValue;

  final String? label;

  final ValueChanged<DateTime?>? onChanged;

  final bool required;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            text: label,
            style: Theme.of(context).inputDecorationTheme.labelStyle,
            children: [if (required) RequiredStar()],
          ),
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClearButton(controller),
            const Icon(Icons.calendar_today),
          ],
        ),
      ),
      onTap: () {
        primaryFocus?.unfocus();
        showDatePicker(
          context: context,
          initialDate: initialValue ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        ).then((value) {
          value != null
              ? controller.text = value.toLocal().toString().split(' ')[0]
              : controller.clear();
          onChanged?.call(value);
        });
      },
      validator: (value) {
        if (required && (value == null || value.trim().isEmpty)) {
          return label != null ? '$label is required' : null;
        }
        return null;
      },
    );
  }
}
