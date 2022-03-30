import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:types_of_textfields/ui/widgets/textfield_1.dart';
import 'package:types_of_textfields/ui/widgets/textfield_4.dart';
import 'widgets/textfield_2.dart';
import 'widgets/textfield_3.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final h = Get.height;
  final w = Get.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 24, 23, 23),
      body: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * 0.05,
                  ),
                  TextField1(),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  TextField2(),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  TextField3(),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  TextField4(),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Thank You 🙏",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: w / 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
