import 'package:flutter/material.dart';
import 'package:types_of_textfields/ui/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Textfields',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
