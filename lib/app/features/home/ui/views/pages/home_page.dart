import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:quickstart_mvvm/app/features/home/ui/viewmodels/home_viewmodel.dart';
import 'package:quickstart_mvvm/app/features/home/ui/views/widgets/user_data_widget.dart';
import 'package:quickstart_mvvm/app/services/service_locator/service_locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final homeViewmodel = ServiceLocator.locator.get<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: switch (homeViewmodel.homeStatus) {
          Status.initial => const Center(child: Text('Empty State')),
          Status.loading => const Center(child: CircularProgressIndicator()),
          Status.success => ListView.builder(
              itemCount: homeViewmodel.data.length,
              itemBuilder: (context, index) {
                return UserDataWidget(user: homeViewmodel.data[index]);
              }),
          Status.error => Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(homeViewmodel.homeError ?? ''),
            )),
        },
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh_rounded),
          onPressed: () => homeViewmodel.getData(),
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
