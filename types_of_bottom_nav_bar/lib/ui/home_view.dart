import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:types_of_bottom_nav_bar/ui/widget/bottom_nav_1_salmon.dart';
import 'package:types_of_bottom_nav_bar/ui/widget/bottom_nav_2_animated.dart';
import 'package:types_of_bottom_nav_bar/ui/widget/bottom_nav_3_snake.dart';
import 'package:types_of_bottom_nav_bar/ui/widget/bottom_nav_4_waterdrop.dart';

class HomwView extends StatefulWidget {
  const HomwView({Key? key}) : super(key: key);

  @override
  State<HomwView> createState() => _HomwViewState();
}

class _HomwViewState extends State<HomwView> {
  final h = Get.height;
  final w = Get.width;
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return index == 0
              ? const SalomonBottomNav()
              : index == 1
                  ? const AnimatedBottomNav()
                  : index == 2
                      ? const SnakeNavBar()
                      : const WaterDropBottomNav();
        },
      ),
    );
  }
}
