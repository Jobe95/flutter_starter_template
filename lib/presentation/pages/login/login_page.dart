import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Logga in för att se content',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Colors.blueGrey),
          ),
          TextButton.icon(
            onPressed: () {
              context.go('/');
            },
            icon: const Text('Gå till fruits detail'),
            label: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
