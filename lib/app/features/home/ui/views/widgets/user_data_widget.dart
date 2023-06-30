import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickstart_mvvm/app/features/home/data/models/data_model.dart';

class UserDataWidget extends StatelessWidget {
  final DataModel user;
  const UserDataWidget({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            onTap: () => GoRouter.of(context).goNamed('details',
                queryParameters: {'data': jsonEncode(user)}),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user.image),
            ),
            title:
                Text(user.name, style: Theme.of(context).textTheme.titleMedium),
            subtitle: Text(
              user.email,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: const Icon(Icons.chevron_right)),
      ],
    );
  }
}
