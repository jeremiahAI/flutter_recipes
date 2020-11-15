import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const route = "/meal-details";

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // height: 50,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Ingredients",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                height: 200,
                child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(meal.ingredients[index]),
                      ),
                    ),
                  ),
                )),
            Container(
              // height: 50,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Steps",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                height: 300,
                child: ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (_, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("#${index + 1}"),
                        ),
                        title: Text(meal.steps[index]),
                      ),
                      Divider(
                        thickness: 0.7,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
