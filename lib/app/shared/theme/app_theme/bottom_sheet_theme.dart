import 'package:flutter/material.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/color_scheme_theme.dart';

class BottomSheetThemeApp {
  static BottomSheetThemeData theme(ThemeMode mode) {
    final colorScheme =
        mode == ThemeMode.light ? lightColorScheme : darkColorScheme;

    return BottomSheetThemeData(
      showDragHandle: true,
      dragHandleColor: colorScheme.primary,
      modalBackgroundColor: colorScheme.background,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      )),
      modalBarrierColor: Colors.black45,
    );
  }
}
