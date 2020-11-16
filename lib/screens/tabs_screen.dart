import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/widgets/main_drawer.dart';

import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favorites;
  TabsScreen(this.favorites);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages;
  final List<String> _titles = ['Categories', 'Favorites'];
  int selectedPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [CategoriesScreen(), FavoritesScreen(widget.favorites)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[selectedPage]),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedPage,
        onTap: (index) => setState(() => selectedPage = index),
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Categories"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favorites"),
        ],
      ),
    );
  }
}
