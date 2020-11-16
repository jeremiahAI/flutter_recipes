class MealTypeFilter {
  bool glutenFree, vegetarian, vegan, lactoseFree;

  MealTypeFilter(
      {this.lactoseFree = false,
      this.glutenFree = false,
      this.vegetarian = false,
      this.vegan = false});
}
