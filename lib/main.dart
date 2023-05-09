import 'package:flutter/material.dart';
import 'package:meals_app_flutter/screens/categories_meals_screen.dart';
import 'package:meals_app_flutter/screens/categories_screen.dart';
import 'package:meals_app_flutter/utils/app_routes.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
          AppRoutes.HOME: (ctx) => const CategoriesScreen(),
          AppRoutes.CATEGORY_MEALS: (ctx) => CategoriesMealsScreen(),
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
