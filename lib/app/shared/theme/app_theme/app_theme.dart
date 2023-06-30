import 'package:flutter/material.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/app_bar_theme.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/buttons_theme.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/color_scheme_theme.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/dialog_theme.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/input_decoration_theme.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/switch_teme.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/text_theme.dart';

class AppTheme {
  static ThemeData theme(ThemeMode mode) => ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        elevatedButtonTheme: ElevatedButtonThemeApp.theme(mode),
        outlinedButtonTheme: OutlinedButtonThemeApp.theme(mode),
        textButtonTheme: TextButtonThemeApp.theme(mode),
        inputDecorationTheme: InputDecorationThemeApp.theme(mode),
        textTheme: TextThemeApp.theme,
        appBarTheme: AppBarThemeApp.theme(mode),
        dialogTheme: DialogThemeApp.theme(mode),
        switchTheme: SwitchThemeApp.theme(mode),
      );

  static ThemeData darkTheme(context, ThemeMode mode) => ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        elevatedButtonTheme: ElevatedButtonThemeApp.theme(mode),
        outlinedButtonTheme: OutlinedButtonThemeApp.theme(mode),
        textButtonTheme: TextButtonThemeApp.theme(mode),
        inputDecorationTheme: InputDecorationThemeApp.theme(mode),
        textTheme: TextThemeApp.theme,
        appBarTheme: AppBarThemeApp.theme(mode),
        dialogTheme: DialogThemeApp.theme(mode),
        switchTheme: SwitchThemeApp.theme(mode),
      );
}
