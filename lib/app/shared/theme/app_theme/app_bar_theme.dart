import 'package:flutter/material.dart';

class AppBarThemeApp {
  static AppBarTheme theme(context) => AppBarTheme(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
        actionsIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
        centerTitle: true,
      );
}
