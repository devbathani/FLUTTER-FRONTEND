import 'package:flutter/material.dart';
import 'package:razorpay_package/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Razorpay Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
