import 'dart:ui';

import 'package:flutter/material.dart';

class GlassmorphismContainer extends StatelessWidget {
  final Widget child;

  const GlassmorphismContainer({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.2),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
