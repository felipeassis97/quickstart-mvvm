import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:quickstart_mvvm/app/features/home/ui/viewmodels/home_viewmodel.dart';
import 'package:quickstart_mvvm/app/features/home/ui/views/widgets/user_data_widget.dart';
import 'package:quickstart_mvvm/app/services/service_locator/service_locator.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeViewmodel = ServiceLocator.locator.get<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Test'),
        ),
        body: switch (homeViewmodel.homeStatus) {
          Status.initial => const Center(child: Text('Empty State')),
          Status.loading => const Center(child: CircularProgressIndicator()),
          Status.success => UserDataWidget(user: homeViewmodel.data!),
          Status.error => const Center(child: Text('Erro')),
        },
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh_rounded),
          onPressed: () => homeViewmodel.getData(),
        ),
      );
    });
  }
}
