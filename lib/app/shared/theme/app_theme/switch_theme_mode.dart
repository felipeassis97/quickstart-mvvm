import 'package:flutter/material.dart';

class SwitchThemeMode {
  static final ValueNotifier<ThemeMode> _themeNotifier =
      ValueNotifier(ThemeMode.system);

  static ValueNotifier<ThemeMode> get theme => _themeNotifier;

  static void toggleTheme(final ThemeMode theme) {
    _themeNotifier.value = theme;
  }
}
