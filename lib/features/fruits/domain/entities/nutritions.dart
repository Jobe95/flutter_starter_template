class Nutritions {
  final int calories;
  final double carbohydrates;
  final double fat;
  final double protein;
  final double sugar;
  Nutritions({
    required this.calories,
    required this.carbohydrates,
    required this.fat,
    required this.protein,
    required this.sugar,
  });

  @override
  String toString() {
    return 'Nutritions(calories: $calories, carbohydrates: $carbohydrates, fat: $fat, protein: $protein, sugar: $sugar)';
  }
}
