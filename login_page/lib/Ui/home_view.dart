import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:types_of_login_pages/Ui/widgets/login_container.dart';
import 'package:types_of_login_pages/Ui/widgets/welcome_flutter_frontend.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final h = Get.height;
  final w = Get.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Transform(
              transform: Matrix4.identity()..rotateZ(15 * 3.1415927 / 90),
              child: Container(
                height: h * 0.20,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.pink),
              ),
            ),
          ),
          Positioned(
            top: h * 1,
            left: w * 0.50,
            child: Transform(
              transform: Matrix4.identity()..rotateZ(15 * 3.1415927 / -100),
              child: Container(
                height: h * 0.20,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.deepPurple),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
            ),
          ),
          LoginContainer(),
          HeyThereFlutterFrontend(),
        ],
      ),
    );
  }
}
