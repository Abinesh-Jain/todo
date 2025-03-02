import 'dart:async';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({
    super.key,
    this.onPressed,
    this.label,
    this.backgroundColor,
  }) : _isLoading = ValueNotifier(false);

  final String? label;

  final FutureOr<void> Function()? onPressed;

  final ValueNotifier<bool> _isLoading;

  final Color? backgroundColor;

  void _onTap() async {
    if (_isLoading.value) return;
    if (onPressed != null) {
      _isLoading.value = true;
      await onPressed!();
      _isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: ValueListenableBuilder(
        valueListenable: _isLoading,
        builder: (_, value, child) => value
            ? Opacity(
                opacity: .5,
                child: Container(
                  decoration: BoxDecoration(color: backgroundColor),
                  child: label != null ? Text(label!) : null,
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                ),
                child: label != null ? Text(label!) : null,
              ),
      ),
    );
  }
}
