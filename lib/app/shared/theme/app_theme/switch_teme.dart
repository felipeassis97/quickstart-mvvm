import 'package:flutter/material.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/color_scheme_theme.dart';

class SwitchThemeApp {
  static SwitchThemeData theme(context, ThemeMode mode) {
    final colorScheme =
        mode == ThemeMode.light ? lightColorScheme : darkColorScheme;
    return SwitchThemeData(
      trackColor: MaterialStateProperty.all(colorScheme.primary),
      trackOutlineColor: MaterialStateProperty.all(colorScheme.primary),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return colorScheme.onPrimary;
        } else if (states.contains(MaterialState.selected)) {
          colorScheme.primaryContainer;
        }

        return colorScheme.primaryContainer;
      }),
      overlayColor:
          MaterialStateProperty.all(colorScheme.secondary.withOpacity(0.5)),
      splashRadius: 24,
      //   materialTapTargetSize: MaterialTapTargetSize.padded,
    );
  }
}
