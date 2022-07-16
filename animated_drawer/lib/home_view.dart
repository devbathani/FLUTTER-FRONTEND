import 'dart:developer';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeView> {
  double width = 0.20;
  bool isChanged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * width,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xff3fada8),
                  Color(0xff808080),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0, 5),
                  blurRadius: 15,
                  spreadRadius: 1.5,
                ),
              ],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    if (isChanged == false) {
                      setState(() {
                        isChanged = true;
                        width = 0.50;
                        log("Is Change <><> $isChanged");
                      });
                    } else {
                      setState(() {
                        isChanged = false;
                        width = 0.20;
                        log("Is Change <> $isChanged");
                      });
                    }
                  },
                  child: Icon(
                    isChanged
                        ? Icons.arrow_back_ios_new_rounded
                        : Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    isChanged
                        ? const Text(
                            "Home",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    isChanged
                        ? const Text(
                            "Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.coffee,
                      color: Colors.white,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    isChanged
                        ? const Text(
                            "Coffee",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
