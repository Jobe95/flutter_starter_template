import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<String> fruits = [
  "Apple",
  "Banana",
  "Orange",
  "Mango",
  "Pineapple",
  "Papaya",
  "Kiwi",
  "Strawberry",
  "Raspberry",
  "Blueberry",
  "Blackberry",
  "Cherry",
  "Grapes",
  "Peach",
  "Plum",
  "Pear",
  "Apricot",
  "Fig",
  "Watermelon",
  "Cantaloupe",
  "Honeydew",
  "Grapefruit",
  "Lemon",
  "Lime",
  "Tangerine",
  "Passionfruit",
  "Dragonfruit",
  "Guava",
  "Lychee",
  "Pomegranate",
  "Persimmon",
  "Cranberry",
  "Currant",
  "Gooseberry",
  "Starfruit",
  "Mulberry",
  "Rambutan",
  "Jackfruit",
  "Coconut",
  "Pineapple",
  "Cherimoya",
  "Blackcurrant",
  "Redcurrant",
  "Whitecurrant",
  "Lingonberry",
  "Bilberry",
  "Miracle fruit",
  "Ackee",
  "Bael fruit"
];

class FruitPage extends StatelessWidget {
  const FruitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: () => context.go(
            Uri(
                path: '/fruits/${fruits[index]}',
                queryParameters: {'id': '${index + 1}'}).toString(),
          ),
          title: Text(
            fruits[index],
          ),
        ),
        itemCount: fruits.length,
      ),
    );
  }
}
