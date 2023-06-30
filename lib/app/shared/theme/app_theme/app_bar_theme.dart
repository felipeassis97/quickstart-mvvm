import 'package:flutter/material.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/color_scheme_theme.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/text_theme.dart';

class AppBarThemeApp {
  static AppBarTheme theme(ThemeMode mode) {
    final colorScheme =
        mode == ThemeMode.light ? lightColorScheme : darkColorScheme;
    return AppBarTheme(
      backgroundColor: colorScheme.inversePrimary,
      titleTextStyle: TextThemeApp.theme.titleLarge?.copyWith(
        color: colorScheme.onBackground,
      ),
      actionsIconTheme: IconThemeData(
        color: colorScheme.onBackground,
      ),
      iconTheme: IconThemeData(
        color: colorScheme.onBackground,
      ),
      centerTitle: false,
    );
  }
}
