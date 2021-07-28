import 'package:flutter/material.dart';
import 'package:mealproject2/provider/provider.dart';
import 'package:mealproject2/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MealsProvider>(
      create: (_) => MealsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TabsScreen(),
      ),
    );
  }
}
