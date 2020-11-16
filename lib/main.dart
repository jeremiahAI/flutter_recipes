import 'package:flutter/material.dart';
import 'package:recipes/dummy_data.dart';
import 'package:recipes/screens/category_meals_screen.dart';
import 'package:recipes/screens/filters_screen.dart';
import 'package:recipes/screens/meal_details_screen.dart';
import 'package:recipes/screens/tabs_screen.dart';

import 'models/meal.dart';
import 'models/meal_type_filter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _filters = MealTypeFilter();
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(MealTypeFilter filters) => setState(() {
        _filters = filters;
        _availableMeals = DUMMY_MEALS.where((meal) {
          if (filters.glutenFree && !meal.isGlutenFree) return false;
          if (filters.lactoseFree && !meal.isLactoseFree) return false;
          if (filters.vegan && !meal.isVegan) return false;
          if (filters.vegetarian && !meal.isVegetarian) return false;
          return true;
        }).toList();
      });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'))),
      home: TabsScreen(),
      routes: {
        CategoryMealsScreen.route: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.route: (ctx) => MealDetailsScreen(),
        FiltersScreen.route: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
