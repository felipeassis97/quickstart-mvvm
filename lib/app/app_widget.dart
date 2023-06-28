import 'package:flutter/material.dart';
import 'package:quickstart_mvvm/app/shared/routes/app_routes.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Quickstart',
      routerConfig: goRouter,
      darkTheme: AppTheme.darkTheme(context),
      theme: AppTheme.theme(context),
      themeMode: ThemeMode.light,
    );
  }
}
