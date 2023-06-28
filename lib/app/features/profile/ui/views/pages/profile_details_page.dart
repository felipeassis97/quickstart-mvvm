import 'package:flutter/material.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Details'),
      ),
      body: const Column(
        children: [
          Text('Username'),
          Text(' - '),
          Text('User e-mail'),
        ],
      ),
    );
  }
}
