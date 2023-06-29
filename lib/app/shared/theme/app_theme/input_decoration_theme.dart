import 'package:flutter/material.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/color_scheme_theme.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/text_theme.dart';

class InputDecorationThemeApp {
  static InputDecorationTheme theme(context, ThemeMode mode) {
    final colorScheme =
        mode == ThemeMode.light ? lightColorScheme : darkColorScheme;
    return InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: colorScheme.onBackground,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: colorScheme.outline,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: colorScheme.error,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: colorScheme.errorContainer,
        ),
      ),
      hintStyle: TextThemeApp.theme.bodyLarge?.copyWith(
        color: colorScheme.outline,
      ),
      labelStyle: TextThemeApp.theme.bodyLarge?.copyWith(
        color: colorScheme.onBackground,
      ),
      floatingLabelStyle: TextThemeApp.theme.labelMedium?.copyWith(
        color: colorScheme.onBackground,
      ),
      errorStyle: TextThemeApp.theme.labelMedium?.copyWith(
        color: colorScheme.error,
        height: 0,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    );
  }
}
