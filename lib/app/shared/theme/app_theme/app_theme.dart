import 'package:flutter/material.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/app_bar_theme.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/buttons_theme.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/color_scheme_theme.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/dialog_theme.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/input_decoration_theme.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/text_theme.dart';

class AppTheme {
  static ThemeData theme(context) => ThemeData(
        useMaterial3: true,
        colorScheme: ColorSchemeApp.light,
        elevatedButtonTheme: ElevatedButtonThemeApp.theme(context),
        outlinedButtonTheme: OutlinedButtonThemeApp.theme(context),
        textButtonTheme: TextButtonThemeApp.theme(context),
        inputDecorationTheme: InputDecorationThemeApp.theme(context),
        textTheme: TextThemeApp.theme,
        appBarTheme: AppBarThemeApp.theme(context),
        dialogTheme: DialogThemeApp.theme(context),
      );

  static ThemeData darkTheme(context) => ThemeData(
        useMaterial3: true,
        colorScheme: ColorSchemeApp.dark,
        elevatedButtonTheme: ElevatedButtonThemeApp.theme(context),
        outlinedButtonTheme: OutlinedButtonThemeApp.theme(context),
        textButtonTheme: TextButtonThemeApp.theme(context),
        inputDecorationTheme: InputDecorationThemeApp.theme(context),
        textTheme: TextThemeApp.theme,
        appBarTheme: AppBarThemeApp.theme(context),
        dialogTheme: DialogThemeApp.theme(context),
      );
}
