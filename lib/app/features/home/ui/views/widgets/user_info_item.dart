import 'package:flutter/material.dart';

class UserInfoItemWidget extends StatelessWidget {
  final IconData icon;
  final String item;
  const UserInfoItemWidget({Key? key, required this.icon, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(item),
    );
  }
}
