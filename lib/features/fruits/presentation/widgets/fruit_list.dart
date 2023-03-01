import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/fruit.dart';

class FruitList extends StatelessWidget {
  const FruitList({
    super.key,
    required this.fruits,
  });

  final List<Fruit> fruits;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: fruits.map((fruit) => FruitCard(fruit: fruit)).toList(),
    );
  }
}

class FruitCard extends StatelessWidget {
  const FruitCard({
    super.key,
    required this.fruit,
  });

  final Fruit fruit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.go('/fruits/${fruit.name}'),
      title: Text(fruit.name),
    );
  }
}
