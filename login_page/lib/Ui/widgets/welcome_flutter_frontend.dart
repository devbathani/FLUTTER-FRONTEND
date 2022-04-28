import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeyThereFlutterFrontend extends StatelessWidget {
  HeyThereFlutterFrontend({Key? key}) : super(key: key);
  final h = Get.height;
  final w = Get.width;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: h * 0.08,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FLutter Frontend",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: w / 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Text(
                "Hey there 👋",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: w / 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
