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
            onTap: () => GoRouter.of(context).go('/home/details', extra: user),
            leading: CircleAvatar(
              radius: 50,
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
