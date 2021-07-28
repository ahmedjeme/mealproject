import 'package:flutter/material.dart';
import 'package:mealproject2/models/category.dart';
import 'package:mealproject2/widgets/category_item.dart';
import 'package:mealproject2/models/dummy.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories = DUMMY_CATEGORIES;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(25.0),
        children:
          categories.map((cData) => CategoryItem(title: cData.title, color: cData.color, id: cData.id,)).toList(),

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 200,
        ),
      ),
    );
  }
}
