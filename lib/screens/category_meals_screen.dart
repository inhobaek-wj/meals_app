import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {

  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> categoryMeals;
  bool _isLoadedInitData = false;

  // initState method is not suitable for use ModalRoute.of(context),
  // because this method is called too early.
  @override
  void initState() {
    // final routeArgs =
    // ModalRoute.of(context).settings.arguments as Map<String,String>;

    // final categoryId = routeArgs['id'];
    // categoryTitle = routeArgs['title'];
    // categoryMeals = DUMMY_MEALS.where((meal) {
    //     return meal.categories.contains(categoryId);
    // }).toList();

    super.initState();
  }

  // this method is called whenever change is detected.
  // so we need to prevent to load data only one time using bool value.
  @override
  void didChangeDependencies() {
    if (_isLoadedInitData) {
      return;
    }

    final routeArgs =
    ModalRoute.of(context).settings.arguments as Map<String,String>;

    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'];
    categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
    }).toList();
    _isLoadedInitData = true;

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
        categoryMeals.removeWhere((item) => item.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),

      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
