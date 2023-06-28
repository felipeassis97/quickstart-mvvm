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
final _profileNavigatorKey = GlobalKey<NavigatorState>();

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
                  NoTransitionPage(child: HomePage()),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) {
                    final data = state.extra as DataModel;
                    return DetailsPage(
                      data: data,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              path: '/profile',
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
