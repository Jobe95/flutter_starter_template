import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int value) {
          // navigate to other sections (just change the pages, bottomNavigation always visible on the screen)
          switch (value) {
            case 0:
              context.go('/feed');
              // context.goNamed('feed'); to navigate by name
              break;
            case 1:
              context.go('/discover');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Discover',
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;

    if (location.startsWith('/feed')) {
      return 0;
    }
    if (location.startsWith('/discover')) {
      return 1;
    }
    return 0;
  }
}
