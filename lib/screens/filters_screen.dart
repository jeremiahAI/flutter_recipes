import 'package:flutter/material.dart';
import 'package:recipes/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const route = "/filters";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
    );
  }
}
