import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  const ClearButton(this.controller, {super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (_, value, child) => value.text.isNotEmpty
          ? IconButton(
              onPressed: controller.clear,
              icon: const Icon(Icons.clear),
            )
          : const SizedBox(),
    );
  }
}
