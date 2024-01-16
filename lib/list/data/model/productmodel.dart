import 'package:equatable/equatable.dart';

class ProductItem extends Equatable {
  const ProductItem({
    required this.itemName,
    required this.itemImage,
    required this.itemNutrition,
    required this.itemPrice,
  });

  final String itemName;
  final String itemImage;
  final NutritionValues itemNutrition;
  final double itemPrice;

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      itemName: json['itemName'] as String,
      itemImage: json['itemImage'] as String,
      itemNutrition: NutritionValues.fromJson(json['itemNutrition']),
      itemPrice: json['itemPrice'] as double,
    );
  }

  @override
  List<Object?> get props => [
        itemName,
        itemImage,
        itemNutrition,
        itemPrice,
      ];
}

class NutritionValues extends Equatable {
  const NutritionValues({
    required this.nutritionItems,
  });

  final List<NutritionItem> nutritionItems;

  String getItemNames() {
    return nutritionItems.map((item) => item.itemName).join(', ');
  }

  double getTotalWeight() {
    return nutritionItems.fold(0, (acc, item) => acc + item.weight);
  }

  double getTotalCalories() {
    return nutritionItems.fold(0, (acc, item) => acc + item.calories);
  }

  double getTotalProteins() {
    return nutritionItems.fold(0, (acc, item) => acc + item.proteins);
  }

  double getTotalFats() {
    return nutritionItems.fold(0, (acc, item) => acc + item.fats);
  }

  double getTotalCarbohydrates() {
    return nutritionItems.fold(0, (acc, item) => acc + item.carbohydrates);
  }

  String getDescription() {
    String description = 'Cals: ${getTotalCalories().toStringAsFixed(2)}cal, ';
    description += 'Prots: ${getTotalProteins().toStringAsFixed(2)}g, ';
    description += 'Fats: ${getTotalFats().toStringAsFixed(2)}g, ';
    description += 'Carbs: ${getTotalCarbohydrates().toStringAsFixed(2)}g';
    return description;
  }

  @override
  List<Object?> get props => [nutritionItems];

  factory NutritionValues.fromJson(Map<String, dynamic> json) {
    List<dynamic> nutritionItemsJson = json['nutritionItems'];

    return NutritionValues(
      nutritionItems: nutritionItemsJson
          .map((itemJson) => NutritionItem.fromJson(itemJson))
          .toList(),
    );
  }
}

class NutritionItem extends Equatable {
  const NutritionItem({
    required this.itemName,
    required this.weight,
    required this.calories,
    required this.proteins,
    required this.fats,
    required this.carbohydrates,
  });

  final String itemName;
  final double weight;
  final double calories;
  final double proteins;
  final double fats;
  final double carbohydrates;

  @override
  List<Object?> get props => [
        itemName,
        weight,
        calories,
        proteins,
        fats,
        carbohydrates,
      ];

  factory NutritionItem.fromJson(Map<String, dynamic> json) {
    return NutritionItem(
      itemName: json['itemName'] as String,
      weight: json['weight'] as double,
      calories: json['calories'] as double,
      proteins: json['proteins'] as double,
      fats: json['fats'] as double,
      carbohydrates: json['carbohydrates'] as double,
    );
  }
}
