import 'package:carousel_slider_package/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Carousel Slider Package',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
