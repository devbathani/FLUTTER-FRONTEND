import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UsernameTextField extends StatelessWidget {
  UsernameTextField({Key? key}) : super(key: key);
  final h = Get.height;
  final w = Get.width;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: Colors.grey,
          fontSize: w / 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: w * 0.01, vertical: h * 0.02),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(w / 50),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(w / 50),
          ),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.grey.shade200,
          size: w / 18,
        ),
        hintText: 'Username',
        hintStyle: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: Colors.grey.shade300,
            fontSize: w / 21,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
