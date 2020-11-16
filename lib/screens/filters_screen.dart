import 'package:flutter/material.dart';
import 'package:recipes/main.dart';
import 'package:recipes/models/meal_type_filter.dart';
import 'package:recipes/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const route = "/filters";
  Function(MealTypeFilter) saveFilters;
  MealTypeFilter filters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var filters = MealTypeFilter();

  @override
  initState() {
    super.initState();
    filters = widget.filters;
  }

  Widget buildSwitchTile(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFilters(filters);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchTile(
                  'Gluten-free',
                  "Only include gluten-free meals",
                  filters.glutenFree,
                  (bool value) => setState(() => filters.glutenFree = value)),
              buildSwitchTile(
                  'Lactose-free',
                  "Only include lactose-free meals",
                  filters.lactoseFree,
                  (bool value) => setState(() => filters.lactoseFree = value)),
              buildSwitchTile(
                  'Vegetarian',
                  "Only include vegetarian meals",
                  filters.vegetarian,
                  (bool value) => setState(() => filters.vegetarian = value)),
              buildSwitchTile(
                  'Vegan',
                  "Only include vegan meals",
                  filters.vegan,
                  (bool value) => setState(() => filters.vegan = value)),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
