import 'package:flutter/cupertino.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_quote_generator_v2/core/widgets/navbar/scaffold_with_navbar.dart';
import 'package:flutter_quote_generator_v2/modules/quotes/page/favorite_quote_page.dart';
import 'package:flutter_quote_generator_v2/modules/quotes/page/random_quote_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final class AppRouter {
  AppRouter._();

  static const String root = '/';

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: root,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (_, __, navigationShell) {
          return ScaffoldWithNavbar(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: root,
                pageBuilder: (_, __) {
                  return const NoTransitionPage(child: RandomQuotePage());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: FavoriteQuotePage.path,
                pageBuilder: (_, __) {
                  return const NoTransitionPage(child: FavoriteQuotePage());
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
