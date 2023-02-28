import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobe_template/presentation/widgets/widgets.dart';

import '../../presentation/pages/pages.dart';
import 'my_nav_obs.dart';

final router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => ErrorPage(error: state.error),
  observers: [
    MyNavigatorObserver(),
  ],
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      redirect: (BuildContext context, GoRouterState state) {
        const isAuthenticated = true;
        if (!isAuthenticated) {
          return '/login';
        }
        return null;
      },
      builder: (context, state) => const HomePage(),
      routes: <RouteBase>[
        ShellRoute(
          builder: (context, state, child) {
            return ScaffoldWithNavbar(child: child);
          },
          routes: <RouteBase>[
            GoRoute(
              name: 'feed',
              path: 'feed',
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const FeedPage(),
                transitionsBuilder: (context, anim1, anim2, child) =>
                    FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeInOutCirc).animate(anim1),
                  child: child,
                ),
              ),
            ),
            GoRoute(
              name: 'discover',
              path: 'discover',
              builder: (context, state) => const DiscoverPage(),
            ),
          ],
        ),
        GoRoute(
          name: 'fruits',
          path: 'fruits',
          builder: (context, state) => const FruitPage(),
          routes: <RouteBase>[
            GoRoute(
              path: ':slug',
              builder: (context, state) {
                final slug = state.params['slug'];
                final id = state.queryParams['id'];
                return FruitDetailPage(
                  id: int.tryParse(id ?? '')?.toInt() ?? 0,
                  slug: slug ?? '',
                );
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      name: 'startup',
      path: '/startup',
      builder: (context, state) {
        return const StartupPage();
      },
    ),
  ],
);
