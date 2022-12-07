import 'package:flutter/material.dart';
import 'package:types_of_animations/slide_animation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Types of animation',
      debugShowCheckedModeBanner: false,
      home: SlideAnimationScreen(),
    );
  }
}
