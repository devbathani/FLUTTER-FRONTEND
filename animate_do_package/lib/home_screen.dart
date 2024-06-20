import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffCC95C0),
              Color(0xffDBD4B4),
              Color(0xff7AA1D2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 150),
            const Text(
              "How to use animate_do for easy animation",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FadeInDown(from: 0, animate: true, child: const Square()),
                FadeInDown(from: 50, animate: true, child: const Square()),
                FadeInDown(from: 100, animate: true, child: const Square()),
                FadeInDown(from: 150, animate: true, child: const Square()),
                FadeInDown(from: 200, animate: true, child: const Square()),
              ],
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BounceInDown(from: 0, child: const Square()),
                BounceInDown(from: 50, child: const Square()),
                BounceInDown(from: 100, child: const Square()),
                BounceInDown(from: 150, child: const Square()),
                BounceInDown(from: 200, child: const Square()),
              ],
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BounceInUp(from: 0, child: const Square()),
                BounceInUp(from: 50, child: const Square()),
                BounceInUp(from: 100, child: const Square()),
                BounceInUp(from: 150, child: const Square()),
                BounceInUp(from: 200, child: const Square()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Square extends StatelessWidget {
  const Square({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: const Color(0xff67549B),
    );
  }
}
