import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> indredients;
  final List<String> steps;
  final int duration;
  final Complexity compelxity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLoctoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
    {
      @required this.id,
      @required this.categories,
      @required this.title,
      @required this.imageUrl,
      @required this.indredients,
      @required this.steps,
      @required this.duration,
      @required this.compelxity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLoctoseFree,
      @required this.isVegan,
      @required this.isVegetarian
    }
  );
}
