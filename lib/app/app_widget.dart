import 'package:flutter/material.dart';
import 'package:quickstart_mvvm/app/shared/routes/app_routes.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/app_theme.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/switch_theme_mode.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: SwitchThemeMode.theme,
      builder: (BuildContext context, ThemeMode theme, _) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Quickstart',
        routerConfig: goRouter,
        theme: AppTheme.theme(theme),
        darkTheme: AppTheme.darkTheme(context, theme),
        themeMode: theme,
      ),
    );
  }
}
