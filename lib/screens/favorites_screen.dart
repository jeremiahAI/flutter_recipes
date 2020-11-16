import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorites;

  FavoritesScreen(this.favorites);

  @override
  Widget build(BuildContext context) {
    return favorites.isEmpty
        ? Center(child: Text("You have no  favorites yet - start adding some"))
        : ListView.builder(
            itemBuilder: (ctx, index) => MealItem(favorites[index]),
            itemCount: favorites.length,
          );
  }
}
