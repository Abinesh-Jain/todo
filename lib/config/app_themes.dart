import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_themes.dart';

class AppThemes {
  static ThemeData light = ThemeData.light().copyWith(
    primaryColor: AppColors.darkGreen,
    textTheme: AppTextThemes.textTheme,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.lightBlue.shade50,
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkGreen),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      labelStyle: AppTextThemes.textTheme.bodyMedium?.copyWith(
        color: AppColors.darkGreen,
      ),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(menuStyle: MenuStyle()),
  );
}
