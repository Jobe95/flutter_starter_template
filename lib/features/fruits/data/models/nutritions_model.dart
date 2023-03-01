import 'package:jobe_template/features/fruits/domain/entities/entities.dart';

class NutritionsModel extends Nutritions {
  NutritionsModel({
    required super.calories,
    required super.carbohydrates,
    required super.fat,
    required super.protein,
    required super.sugar,
  });

  factory NutritionsModel.fromJson(Map<String, dynamic> json) {
    return NutritionsModel(
      calories: json['calories'] as int,
      carbohydrates: _parseDouble(json['carbohydrates']),
      fat: _parseDouble(json['fat']),
      protein: _parseDouble(json['protein']),
      sugar: _parseDouble(json['sugar']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'carbohydrates': carbohydrates,
      'fat': fat,
      'protein': protein,
      'sugar': sugar,
    };
  }

  static double _parseDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else {
      return value;
    }
  }
}
