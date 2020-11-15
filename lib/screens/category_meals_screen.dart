import 'package:flutter/material.dart';
import 'package:recipes/dummy_data.dart';
import 'package:recipes/models/category.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const route = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final List<Meal> mealsList = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) => MealItem(mealsList[index]),
          itemCount: mealsList.length,
        ));
  }
}
