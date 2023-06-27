import 'package:flutter/material.dart';
import 'package:quickstart_mvvm/app/features/home/data/models/data_model.dart';

class UserDataWidget extends StatelessWidget {
  final DataModel user;
  const UserDataWidget({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const CircleAvatar(),
        title: Text(user.title),
        subtitle: Text(
          user.completed.toString(),
        ));
  }
}
