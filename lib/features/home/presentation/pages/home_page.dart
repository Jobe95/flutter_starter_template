import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
            onPressed: () {
              context.go('/fruits');
            },
            icon: const Text('Gå till fruits'),
            label: const Icon(Icons.navigate_next),
          ),
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          TextButton.icon(
            onPressed: () => context.go('/fruits/apple'),
            icon: const Text('Gå till fruits detail för äpple'),
            label: const Icon(Icons.navigate_next),
          ),
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          TextButton.icon(
            onPressed: () {
              context.go('/feed');
            },
            icon: const Text('Gå till Navbar Exempel'),
            label: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
