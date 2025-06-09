import 'package:flutter/material.dart';
import 'package:mealsapp/Models/categoryy.dart';
import 'package:mealsapp/Models/meal.dart';
import 'package:mealsapp/Screens/meals.dart';
import 'package:mealsapp/Widgets/category_grid_item.dart';
import 'package:mealsapp/data/dummydata.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals ;

  void _selectCategory(BuildContext context, Categoryy category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context,category);
                })
        ],
    );
  }
}
