import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool toShow = false;
  @override
  void initState() {
    toShowTimeDelay();
    super.initState();
  }

  void toShowTimeDelay() async {
    log("message");
    await Future.delayed(const Duration(seconds: 9), () {});
    setState(() {
      toShow = true;
      log("message");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children: [
            toShow
                ? Lottie.asset("assets/celebration.json")
                : Container(
                    height: 200.h,
                    width: MediaQuery.sizeOf(context).width,
                    color: Colors.transparent,
                  ),
            Positioned(
              top: 250.h,
              height: 200.h,
              child: Lottie.asset("assets/happy-diwali.json"),
            ),
          ],
        ),
      ),
    );
  }
}
