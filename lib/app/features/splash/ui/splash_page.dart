import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void _loadAppSettings() async {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).go('/home');
    });
  }

  @override
  void initState() {
    super.initState();
    _loadAppSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
