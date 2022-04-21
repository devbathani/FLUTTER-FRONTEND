import 'package:flutter/material.dart';
import 'package:types_of_bottom_nav_bar/ui/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Types of Bottom Navigation Bar',
      theme: ThemeData(
        brightness: Brightness.dark,
      ), 
      home: const HomwView(),
    );
  }
}
