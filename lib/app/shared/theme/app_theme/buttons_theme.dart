import 'package:flutter/material.dart';

class ElevatedButtonThemeApp {
  static ElevatedButtonThemeData theme(context) => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
        ),
      );
}

class OutlinedButtonThemeApp {
  static OutlinedButtonThemeData theme(context) => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
        ),
      );
}

class TextButtonThemeApp {
  static TextButtonThemeData theme(context) => TextButtonThemeData(
        style: TextButton.styleFrom(),
      );
}
