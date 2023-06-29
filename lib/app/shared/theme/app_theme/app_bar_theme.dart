import 'package:flutter/material.dart';

class AppBarThemeApp {
  static AppBarTheme theme(context) => AppBarTheme(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: false,
      );
}
