import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  LoginButton({Key? key}) : super(key: key);
  final h = Get.height;
  final w = Get.width;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: h * 0.06,
          width: w * 0.35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0.02 * w),
          ),
          child: Center(
            child: Text(
              "Login",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: w / 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
