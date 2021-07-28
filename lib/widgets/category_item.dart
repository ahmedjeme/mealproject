import 'package:flutter/material.dart';
import 'package:mealproject2/screens/category_screen.dart';

class CategoryItem extends StatelessWidget {
 final String id;
 final String title;
 final Color color;
  CategoryItem({this.id, this.title, this.color});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryScreen(id: id, title: title,)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
