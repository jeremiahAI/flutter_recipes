import 'package:flutter/material.dart';
import 'package:recipes/models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final Category category;
  //
  // CategoryMealsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
        ),
        body: Center(
          child: Text('Category meals'),
        ));
  }
}
