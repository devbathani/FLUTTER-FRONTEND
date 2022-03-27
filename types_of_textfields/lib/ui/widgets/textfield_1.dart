import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TextField1 extends StatelessWidget {
   TextField1({Key? key}) : super(key: key);
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
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
          size: w / 18,
        ),
        hintText: 'TextField 1',
        hintStyle: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: Colors.grey,
            fontSize: w / 21,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
