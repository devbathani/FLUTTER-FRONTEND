import 'package:flutter/material.dart';
import 'package:hero_widget/home_screen_2.dart';

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
              Color(0xffB0DAB9),
              Color(0xffDAD299),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    "HERO Widget",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "person",
                  child: Image.asset(
                    "assets/person.png",
                    height: 200,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const HomeScreen2(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
