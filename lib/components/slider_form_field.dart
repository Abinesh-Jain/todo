import 'package:flutter/material.dart';

class SliderFormField extends StatelessWidget {
  const SliderFormField({
    super.key,
    this.initialValue,
    this.label,
    this.onChanged,
    this.required = true,
  });

  final double? initialValue;

  final String? label;

  final ValueChanged<double?>? onChanged;

  final bool required;

  @override
  Widget build(BuildContext context) {
    return FormField<double>(
      initialValue: initialValue,
      builder: (state) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            label: RichText(
              text: TextSpan(
                text: label,
                style: Theme.of(context).inputDecorationTheme.labelStyle,
                children: [
                  if (required)
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
            errorText: state.errorText,
          ),
          child: Slider.adaptive(
            value: state.value ?? 0,
            onChanged: (value) {
              state.didChange(value);
              onChanged?.call(value);
            },
            min: 0,
            max: 100,
            divisions: 100,
            label: '${(state.value ?? 0).round()} %',
          ),
        );
      },
      validator: (value) {
        if (required && (value == null || value == 0)) {
          return label != null ? '$label is required' : null;
        }
        return null;
      },
    );
  }
}
