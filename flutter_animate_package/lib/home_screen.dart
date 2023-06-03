import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
              Color(0xff7b4397),
              Color(0xffdc2430),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: const Text(
                    "Flutter Animate Package",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ).animate().shake(),
                )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 650,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Animate(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  ).animate().flip().shimmer(
                        color: Colors.grey,
                        duration: const Duration(seconds: 2),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
