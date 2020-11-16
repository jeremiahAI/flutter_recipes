import 'package:flutter/material.dart';
import 'package:recipes/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DrawerListTileWidget("Meals", Icons.restaurant,
              () => Navigator.of(context).pushReplacementNamed('/')),
          DrawerListTileWidget(
              'Settings',
              Icons.settings,
              () => Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.route))
        ],
      ),
    );
  }
}

class DrawerListTileWidget extends StatelessWidget {
  final String title;

  final IconData iconData;
  final Function onTap;
  DrawerListTileWidget(this.title, this.iconData, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
