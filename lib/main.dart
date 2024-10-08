import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/home_view.dart'; // Import the HomeView

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(), // Set HomeView as the home
    );
  }
}
