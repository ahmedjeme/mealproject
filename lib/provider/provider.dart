import 'package:flutter/cupertino.dart';
import 'package:mealproject2/models/dummy.dart';
import 'package:mealproject2/models/meal.dart';
import 'package:flutter/foundation.dart';

class MealsProvider with ChangeNotifier {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false,
  };

  Map<String, bool> get filters {
    return _filters;
  }

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> get availableMeals {
    return _availableMeals;
  }

  List<Meal> _favoritedMeals = [];
  List<Meal> get favoritedMeals {
    return _favoritedMeals;
  }

   unFavoritedMeals() {
    if(_filters['gluten'] || _filters['lactoseFree'] || _filters['vegan'] || _filters['vegetarian'] == true){
      return _favoritedMeals= [];
    }
  }

  bool isFavorite(String id) {
    if(id != null || id.isNotEmpty) {
    return _favoritedMeals.any((meal) => meal.id == id);
    } else {
      return true;
    }
  }

  void toggleMeals(String mealId) {
    var existingIndex = _favoritedMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
        _favoritedMeals.removeAt(existingIndex);
    } else {
        _favoritedMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
    notifyListeners();
  }

  void setFilters(Map<String, bool> filterData) {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
      notifyListeners();
  }
}