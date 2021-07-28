import 'package:flutter/material.dart';
import 'package:mealproject2/screens/categories_screen.dart';
import 'package:mealproject2/screens/filters_screen.dart';
import 'package:mealproject2/screens/tabs_screen.dart';

class DrawerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Colors.yellowAccent,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Coock Up !',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Categories',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(Icons.restaurant),
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TabsScreen(),), (Route<dynamic> route) => false);
            },
          ),
          Divider(),
          ListTile(
            leading: Text(
              'Filters',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(Icons.restaurant),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FiltersScreen()));
            },
          ),
        ],
      ),
    );
  }
}
