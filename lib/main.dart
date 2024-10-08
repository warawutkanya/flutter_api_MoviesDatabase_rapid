import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/home_view.dart'; // Import your HomeView
import 'routes/app_routes.dart'; // Import your AppRoutes

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App Name',
      initialRoute: AppRoutes.HOME, // Set the initial route
      getPages: AppRoutes.routes, // Register your routes
      // You can set the home view directly as follows, but since you're using routes, this line is not necessary
      // home: HomeView(),
    );
  }
}
