import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool toShow = false;
  @override
  void initState() {
    updateToShow();
    super.initState();
  }

  void updateToShow() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    toShow = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Stack(
          children: [
            toShow
                ? Positioned(
                    top: 100,
                    child: LottieBuilder.asset(
                      "assets/colors.json",
                      height: 900,
                    ),
                  )
                : const SizedBox.shrink(),
            Align(
              alignment: Alignment.center,
              child: LottieBuilder.asset(
                "assets/happyholi.json",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
