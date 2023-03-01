import 'package:flutter/material.dart';
import 'package:jobe_template/core/constants/app_constants.dart';

import '../../domain/entities/fruit.dart';

class FruitInfo extends StatelessWidget {
  const FruitInfo({
    super.key,
    required this.fruit,
  });

  final Fruit fruit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMediumPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Card(
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(kMediumPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    fruit.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Genus: ${fruit.genus}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Family: ${fruit.family}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Order: ${fruit.order}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(kMediumPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nutrition',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: kSmallPadding),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.local_fire_department),
                      const SizedBox(width: kSmallPadding),
                      Text(
                        'Calories: ${fruit.nutritions.calories}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: kSmallPadding),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.grain),
                      const SizedBox(width: kSmallPadding),
                      Text(
                        'Carbohydrates: ${fruit.nutritions.carbohydrates}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: kSmallPadding),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.fastfood),
                      const SizedBox(width: kSmallPadding),
                      Text(
                        'Fat: ${fruit.nutritions.fat}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: kSmallPadding),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.self_improvement),
                      const SizedBox(width: kSmallPadding),
                      Text(
                        'Protein: ${fruit.nutritions.protein}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: kSmallPadding),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.cake),
                      const SizedBox(width: kSmallPadding),
                      Text(
                        'Sugar: ${fruit.nutritions.sugar}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
