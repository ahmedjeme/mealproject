import 'package:flutter/material.dart';
import 'package:mealproject2/app_bar/app_bar.dart';
import 'package:mealproject2/screens/categories_screen.dart';
import 'package:mealproject2/screens/favorite_screen.dart';
import 'package:mealproject2/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int index = 0;
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var newPages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(), 'title': 'Favorites'},
    ];
    return Scaffold(
      key: _key,
      appBar: AppBarComponent().appBar(newPages[index]['title']),
      drawer: DrawerItem(),
      onDrawerChanged: (isOpened) {
        setState(() {});
      },
      body: newPages[index]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellowAccent,
        selectedItemColor: Colors.black,
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            backgroundColor: Colors.white,
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            backgroundColor: Colors.white,
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
