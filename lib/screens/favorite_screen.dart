import 'package:flutter/material.dart';
import 'package:mealproject2/provider/provider.dart';
import 'package:mealproject2/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<MealsProvider>(context).unFavoritedMeals();
    var favoritedMeals = Provider.of<MealsProvider>(context).favoritedMeals;
    return Scaffold(
      body:  favoritedMeals == null || favoritedMeals.isEmpty ? Center(child: Text('No fivorites')) : ListView.builder(
            itemBuilder: (ctx, i) {
              return MealItemScreen(id: favoritedMeals[i].id,
                  title: favoritedMeals[i].title,
                  imageUrl: favoritedMeals[i].imageUrl,
                  complexity: favoritedMeals[i].complexity,
                  affordability: favoritedMeals[i].affordability,
                  duration: favoritedMeals[i].duration);
            },
            itemCount: favoritedMeals.length,
          ),
    );
  }
}
