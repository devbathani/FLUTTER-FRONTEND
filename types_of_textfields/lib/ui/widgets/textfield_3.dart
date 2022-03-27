import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TextField3 extends StatelessWidget {
  TextField3({Key? key}) : super(key: key);
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
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.yellow, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(w / 40),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.yellow, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(w / 40),
          ),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.yellow,
          size: w / 18,
        ),
        labelText: 'TextField 3',
        labelStyle: GoogleFonts.poppins(
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
