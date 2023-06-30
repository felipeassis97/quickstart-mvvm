import 'package:flutter/material.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/color_scheme_theme.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/text_theme.dart';

class DialogThemeApp {
  static DialogTheme theme(ThemeMode mode) {
    final colorScheme =
        mode == ThemeMode.light ? lightColorScheme : darkColorScheme;
    return DialogTheme(
      titleTextStyle: TextThemeApp.theme.titleLarge?.copyWith(
        color: colorScheme.onBackground,
        fontWeight: FontWeight.w700,
      ),
      contentTextStyle: TextThemeApp.theme.titleMedium?.copyWith(
        color: colorScheme.onBackground,
        fontWeight: FontWeight.w400,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}
