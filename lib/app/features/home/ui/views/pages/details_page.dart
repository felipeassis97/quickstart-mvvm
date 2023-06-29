import 'package:flutter/material.dart';
import 'package:quickstart_mvvm/app/features/home/data/models/data_model.dart';
import 'package:quickstart_mvvm/app/features/home/ui/views/widgets/user_info_item.dart';

class DetailsPage extends StatelessWidget {
  final DataModel data;
  const DetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(data.image),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.inverseSurface),
                    ),
                    Text(
                      ', ${data.age.toString()} years',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.inverseSurface),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          UserInfoItemWidget(
            icon: Icons.email_rounded,
            item: data.email,
          ),
          UserInfoItemWidget(
            icon: Icons.phone_rounded,
            item: data.phone,
          ),
          UserInfoItemWidget(
            icon: Icons.description_rounded,
            item: data.description,
          ),
        ],
      ),
    );
  }
}
