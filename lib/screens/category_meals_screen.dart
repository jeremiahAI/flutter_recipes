import 'package:flutter/material.dart';
import 'package:recipes/dummy_data.dart';
import 'package:recipes/models/category.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const route = '/category-meals';

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
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!loadedInitData) {
      category = ModalRoute.of(context).settings.arguments as Category;
      mealsList = DUMMY_MEALS
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
          itemBuilder: (ctx, index) => MealItem(
              mealsList[index],
              (meal) => setState(() {
                    mealsList.removeWhere((element) {
                      return element.id == meal.id;
                    });
                  })),
          itemCount: mealsList.length,
        ));
  }
}
