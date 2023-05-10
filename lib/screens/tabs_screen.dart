import 'package:flutter/material.dart';
import 'package:meals_app_flutter/models/meal.dart';
import 'package:meals_app_flutter/screens/categories_screen.dart';
import 'package:meals_app_flutter/screens/favorite_screen.dart';

import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favoriteMeals, {super.key});
  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late final List<Map<String, Object>> _screens = [
    {
      'title': 'Lista de Categorias',
      'screen': const CategoriesScreen(),
    },
    {'title': 'Meus Favoritos', 'screen': FavoriteScreen(widget.favoriteMeals)},
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
      ),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      drawer: const Drawer(
        child: MainDrawer(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedScreenIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favoritos',
            ),
          ]),
    );
  }
}
