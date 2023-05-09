import 'package:flutter/cupertino.dart';
import 'package:meals_app_flutter/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem(String title, {super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          category.color.withOpacity(0.5),
          category.color,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Text(category.title),
    );
  }
}
