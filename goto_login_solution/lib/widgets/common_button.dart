import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  const CommonButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: const Color(0xff1F41BB),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0xff1F41BB),
            spreadRadius: 0.2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
