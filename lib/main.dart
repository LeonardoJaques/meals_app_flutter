import 'package:flutter/material.dart';
import 'package:meals_app_flutter/data/dummy_data.dart';
import 'package:meals_app_flutter/models/meal.dart';
import 'package:meals_app_flutter/screens/categories_meals_screen.dart';
import 'package:meals_app_flutter/screens/meal_detail_screen.dart';
import 'package:meals_app_flutter/screens/settings_screen.dart';
import 'package:meals_app_flutter/screens/tabs_screen.dart';
import 'package:meals_app_flutter/utils/app_routes.dart';

import 'models/settings.dart';

void main() => runApp(const MainApp());

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vamos Cozinhar?',
        theme: ThemeData(
            canvasColor: const Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                  titleLarge: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'RobotoCondensed',
                  ),
                ),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.pink,
            ).copyWith(secondary: Colors.amber)),
        routes: {
          AppRoutes.HOME: (ctx) => const TabsScreen(),
          AppRoutes.CATEGORY_MEALS: (ctx) => CategoriesMealsScreen(
                meals: _availableMeals,
              ),
          AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
          AppRoutes.SETTINGS: (ctx) => SettingsScreen(
                onSettingsChanged: _filterMeals,
              ),
        });
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vamos Cozinhar?'),
      ),
      body: const Center(
        child: Text('Navegar é preciso!'),
      ),
    );
  }
}
