import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton.icon(
            onPressed: () {
              context.goNamed('home');
            },
            icon: const Text('Gå till Home Page'),
            label: const Icon(Icons.navigate_next),
          ),
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
