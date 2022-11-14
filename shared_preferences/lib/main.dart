import 'package:flutter/material.dart';
import 'package:shared_preferences/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shared Prefs',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
