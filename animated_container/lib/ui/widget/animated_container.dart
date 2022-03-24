import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatelessWidget {
  const AnimatedContainerWidget({Key? key, required this.height, required this.width}) : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      height: h * height,
      width: w * width,
      duration: const Duration(seconds: 1),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 191, 204, 214),
        boxShadow: [
          BoxShadow(
            color: Color(0xffeef2f3),
            blurRadius: 15,
            spreadRadius: 1.5,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Color(0xff8e9eab),
            blurRadius: 15,
            spreadRadius: 1.5,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          "Click Me",
          style: TextStyle(
            color: Colors.white,
            fontSize: w / 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
