import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffded3cb),
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
            height: 300.h,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  left: 50.w,
                  child: Image.asset(
                    'assets/ring.png',
                    height: 250.h,
                    width: 250.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 50.w,
                  child: Image.asset('assets/diya.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
