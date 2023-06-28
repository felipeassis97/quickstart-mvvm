import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Profile'),
        ),
        body: Column(
          children: [
            const Text('Profile Page'),
            ElevatedButton(
                onPressed: () => GoRouter.of(context).go('/profile/details'),
                child: const Text('Details page'))
          ],
        ),
      );
    });
  }
}
