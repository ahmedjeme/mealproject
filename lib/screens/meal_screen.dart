import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealproject2/app_bar/app_bar.dart';
import 'package:mealproject2/provider/provider.dart';
import 'package:provider/provider.dart';

class MealDetailsScreen extends StatefulWidget {
  final String id;
  const MealDetailsScreen({this.id});
  @override
  _MealDetailsScreenState createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  Widget _buildContainer(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var selectedMeal =
        Provider.of<MealsProvider>(context, listen: false).availableMeals;
    // var toggelMeal = Provider.of<MealsProvider>(context, listen: false).toggleMeals(widget.id);
    var isFavorite = Provider.of<MealsProvider>(context, listen: false)
        .isFavorite(widget.id);
    var curSelectedMeal =
        selectedMeal.firstWhere((meal) => meal.id == widget.id);
    return Scaffold(
      appBar: AppBarComponent().appBar(curSelectedMeal.title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
              child: Image.network(
                curSelectedMeal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            _buildContainer(context, 'Steps'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Colors.yellowAccent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      curSelectedMeal.ingredients[index],
                    ),
                  ),
                ),
                itemCount: curSelectedMeal.ingredients.length,
              ),
            ),
            _buildContainer(context, 'Ingredients'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Colors.yellowAccent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      curSelectedMeal.steps[index],
                    ),
                  ),
                ),
                itemCount: curSelectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<MealsProvider>(
        builder: (context, value, child) {
          return FloatingActionButton(
            child: isFavorite ? Icon(Icons.star) : Icon(Icons.star_outline),
            backgroundColor: Colors.black,
            onPressed: () {
              setState(() {
               return value.toggleMeals(widget.id);
              });
            },
          );
        },

      ),
    );
  }
}
