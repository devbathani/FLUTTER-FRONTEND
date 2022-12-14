import 'package:flutter/material.dart';
import 'package:geolocator_package/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Geolocator Package',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
