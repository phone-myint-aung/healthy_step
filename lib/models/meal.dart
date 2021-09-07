import 'package:healthy_step/models/ingredient.dart';

class Meal {
  final String image, bgImage, title;
  final int calories, time;
  final List<int> percentageList;
  final String recipe;
  final List<Ingredient> ingredients;

  Meal({
    required this.title,
    required this.image,
    required this.bgImage,
    required this.calories,
    required this.time,
    required this.percentageList,
    required this.ingredients,
    required this.recipe,
  });
}
