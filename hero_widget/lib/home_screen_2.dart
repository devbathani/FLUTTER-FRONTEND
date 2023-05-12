import 'package:flutter/material.dart';
import 'package:hero_widget/custom_container.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffB0DAB9),
              Color(0xffDAD299),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    GlassmorphismContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Thank You",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 100,
              left: 110,
              child: Hero(
                tag: "person",
                child: Image.asset(
                  "assets/person.png",
                  height: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
