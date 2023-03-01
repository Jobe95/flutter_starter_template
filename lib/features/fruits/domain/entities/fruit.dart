import 'package:jobe_template/features/fruits/domain/entities/entities.dart';

class Fruit {
  final String family;
  final String genus;
  final int id;
  final String name;
  final String order;
  final Nutritions nutritions;
  Fruit({
    required this.family,
    required this.genus,
    required this.id,
    required this.name,
    required this.order,
    required this.nutritions,
  });

  @override
  String toString() {
    return 'Fruit(family: $family, genus: $genus, id: $id, name: $name, order: $order, nutritions: $nutritions)';
  }
}
