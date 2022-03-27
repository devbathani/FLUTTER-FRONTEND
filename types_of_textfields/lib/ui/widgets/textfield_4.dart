import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TextField4 extends StatelessWidget {
   TextField4({Key? key}) : super(key: key);
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
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(w / 40),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(w / 40),
                ),
              ),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.blue,
                size: w / 18,
              ),
              labelText: 'TextField 4',
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
