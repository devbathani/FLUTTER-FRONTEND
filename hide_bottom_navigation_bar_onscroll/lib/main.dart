import 'package:flutter/material.dart';
import 'package:hide_bottom_navigation_bar_onscroll/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hide Bottom Navigation Bar On Scroll',
      home: HomeScreen(),
    );
  }
}
