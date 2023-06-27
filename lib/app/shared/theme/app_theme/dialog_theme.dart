import 'package:flutter/material.dart';

class DialogThemeApp {
  static DialogTheme theme(context) => const DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      );
}
