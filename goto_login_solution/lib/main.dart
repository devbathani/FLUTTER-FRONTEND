import 'package:flutter/material.dart';
import 'package:goto_login_solution/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Goto Login Page Solution',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
