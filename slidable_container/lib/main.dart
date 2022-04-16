import 'package:flutter/material.dart';
import 'package:slidable_container/ui/home_view.dart';

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
      title: 'Slidable Container',
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: HomeView(),
    );
  }
}   
