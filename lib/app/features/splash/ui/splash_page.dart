import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  void _loadAppSettings(context) async {}

  @override
  Widget build(BuildContext context) {
    _loadAppSettings(context);
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).replace('/home');
    });

    return Scaffold(
      body: Container(
        color: const Color(0XFF1C5A8F),
      ),
    );
  }
}
