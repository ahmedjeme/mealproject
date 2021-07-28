import 'package:flutter/material.dart';
import 'package:mealproject2/app_bar/app_bar.dart';
import 'package:mealproject2/models/dummy.dart';
import 'package:mealproject2/models/meal.dart';
import 'package:mealproject2/provider/provider.dart';
import 'package:mealproject2/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  final String id;
  final String title;

  CategoryScreen({this.id, this.title});

  @override
  Widget build(BuildContext context) {
    var currentMeals = Provider.of<MealsProvider>(context, listen: false).availableMeals;
    var displayMeals = currentMeals.where((meal) => meal.categories.contains(id)).toList();
    return Scaffold(
      appBar: AppBarComponent().appBar(title),
      body: ListView.builder(
        itemBuilder: (context, i) => MealItemScreen(
            id: displayMeals[i].id,
            title: displayMeals[i].title,
            imageUrl: displayMeals[i].imageUrl,
            complexity: displayMeals[i].complexity,
            affordability: displayMeals[i].affordability,
            duration: displayMeals[i].duration),
        itemCount: displayMeals.length,
      ),
    );
  }
}
