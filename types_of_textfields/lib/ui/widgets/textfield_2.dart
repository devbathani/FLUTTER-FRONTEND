import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TextField2 extends StatelessWidget {
  TextField2({Key? key}) : super(key: key);
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
          borderSide: const BorderSide(color: Colors.orange, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(w / 50),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(w / 50),
          ),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.orange,
          size: w / 18,
        ),
        hintText: 'TextField 2',
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
