import 'package:animated_container/ui/widget/animated_container.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double height = 0.25;
  double width = 0.55;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff8e9eab),
              Color(0xffeef2f3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: h * 0.15,
            ),
            Text(
              "Animated Container",
              style: TextStyle(
                color: Colors.black54,
                fontSize: w / 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  height = 0.40;
                  width = 0.85;
                });
              },
              child: AnimatedContainerWidget(height: height, width: width),
            ),
          ],
        ),
      ),
    );
  }
}
