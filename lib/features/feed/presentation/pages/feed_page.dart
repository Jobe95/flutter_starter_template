import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton.icon(
            onPressed: () {
              context.goNamed('feed-item');
            },
            icon: const Text('Gå till Feed Item'),
            label: const Icon(Icons.navigate_next),
          ),
          const Center(
            child: Text('Feed Page'),
          ),
        ],
      ),
    );
  }
}
