import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickstart_mvvm/app/shared/theme/widgets/navigation_menu/navigation_bar/navigation_bar_widget.dart';
import 'package:quickstart_mvvm/app/shared/theme/widgets/navigation_menu/navigation_rail/navigation_rail_widget.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 450) {
        return ScaffoldWithNavigationBar(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        );
      } else {
        return ScaffoldWithNavigationRail(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        );
      }
    });
  }
}
