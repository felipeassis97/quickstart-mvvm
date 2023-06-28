import 'package:flutter/material.dart';
import 'package:quickstart_mvvm/app/features/home/data/models/data_model.dart';

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
          Text(data.name),
          const Text(' - '),
          Text(data.email),
        ],
      ),
    );
  }
}
