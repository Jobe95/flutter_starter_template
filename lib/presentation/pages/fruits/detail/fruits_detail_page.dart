import 'package:flutter/material.dart';

class FruitDetailPage extends StatelessWidget {
  const FruitDetailPage({
    super.key,
    required this.id,
    required this.slug,
  });

  final int id;
  final String slug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Fruits Detail Page'),
            Text('SLUG: $slug'),
            Text('Fruit ID: $id'),
          ],
        ),
      ),
    );
  }
}
