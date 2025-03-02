import 'package:flutter/material.dart';

class RequiredStar extends TextSpan {
  RequiredStar({String? text, TextStyle? style})
      : super(
          text: text ?? ' *',
          style: style?.copyWith(color: Colors.red) ??
              const TextStyle(color: Colors.red),
        );
}
