import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickstart_mvvm/app/features/home/data/models/data_model.dart';
import 'package:quickstart_mvvm/app/features/home/ui/views/pages/details_page.dart';
import 'package:quickstart_mvvm/app/features/home/ui/views/pages/home_page.dart';
import 'package:quickstart_mvvm/app/features/profile/ui/views/pages/profile_details_page.dart';
import 'package:quickstart_mvvm/app/features/profile/ui/views/pages/profile_page.dart';
import 'package:quickstart_mvvm/app/features/splash/ui/splash_page.dart';
import 'package:quickstart_mvvm/app/shared/theme/widgets/navigation_menu/scaffold_with_nested_navigation.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _settingsNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HomePage()),
              routes: [
                GoRoute(
                  path: 'details',
                  name: 'details',
                  builder: (context, state) {
                    final params = jsonDecode(state.queryParameters['data']!);
                    final data = DataModel.fromJson(params);
                    return DetailsPage(data: data);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsNavigatorKey,
          routes: [
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfilePage(),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const ProfileDetailsPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
