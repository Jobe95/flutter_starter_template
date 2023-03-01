import 'package:jobe_template/features/fruits/data/models/nutritions_model.dart';

import '../../domain/entities/entities.dart';

class FruitModel extends Fruit {
  FruitModel({
    required String family,
    required String genus,
    required int id,
    required String name,
    required String order,
    required NutritionsModel nutritions,
  }) : super(
          family: family,
          genus: genus,
          id: id,
          name: name,
          order: order,
          nutritions: nutritions,
        );

  factory FruitModel.fromJson(Map<String, dynamic> json) {
    return FruitModel(
      family: json['family'],
      genus: json['genus'],
      id: json['id'],
      name: json['name'],
      order: json['order'],
      nutritions: NutritionsModel.fromJson(json['nutritions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'family': family,
      'genus': genus,
      'id': id,
      'name': name,
      'order': order,
      'nutritions': nutritions,
    };
  }
}
