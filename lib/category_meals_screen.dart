import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),

      body: Center(
        child: Text('Meals of the category'),
      ),
    );
  }

}
