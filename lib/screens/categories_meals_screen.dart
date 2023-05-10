import 'package:flutter/material.dart';
import 'package:meals_app_flutter/components/meal_item.dart';
import 'package:meals_app_flutter/models/category.dart';
import 'package:meals_app_flutter/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;
  const CategoriesMealsScreen(this.meals, {super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(meal: categoryMeals[index]);
          },
        ),
      ),
    );
  }
}
