import 'package:flutter/material.dart';
import 'package:recipes/dummy_data.dart';
import 'package:recipes/models/category.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const route = '/category-meals';
  List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> mealsList;
  Category category;
  bool loadedInitData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mealsList = widget.availableMeals;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!loadedInitData) {
      category = ModalRoute.of(context).settings.arguments as Category;
      mealsList = mealsList
          .where((meal) => meal.categories.contains(category.id))
          .toList();
      loadedInitData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
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
