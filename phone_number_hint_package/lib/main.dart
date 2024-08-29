import 'package:flutter/material.dart';
import 'package:phone_number_hint_package/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Phone numnber hint',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
