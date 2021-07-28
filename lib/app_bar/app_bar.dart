import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarComponent {
  Widget appBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.yellowAccent,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
