import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  String get complexity {
    switch (meal.complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
    }
  }

  const MealItem(this.meal);

  String get affordability {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                    // loadingBuilder: (BuildContext context, Widget child,
                    //     ImageChunkEvent loadingProgress) {
                    //   if (loadingProgress == null) return child;
                    //   return Center(
                    //     child: CircularProgressIndicator(
                    //       value: loadingProgress.expectedTotalBytes != null
                    //           ? loadingProgress.cumulativeBytesLoaded /
                    //               loadingProgress.expectedTotalBytes
                    //           : null,
                    //     ),
                    //   );
                    // },
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 250,
                    color: Colors.black54,
                    child: Text(meal.title,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text("${meal.duration} min")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(complexity)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_outlined),
                      SizedBox(width: 6),
                      Text(affordability)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void selectMeal(BuildContext context) {}
}
