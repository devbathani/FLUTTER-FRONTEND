import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginContainer extends StatelessWidget {
   LoginContainer({Key? key}) : super(key: key);
final h = Get.height;
  final w = Get.width;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: h * 0.50,
        width: w * 0.80,
        decoration: BoxDecoration(
          gradient: const RadialGradient(
            colors: [
              Colors.pink,
              Colors.deepPurple,
            ],
            radius: 1.5,
            center: Alignment(-0.8, -0.6),
          ),
          borderRadius: BorderRadius.circular(w * 0.02),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.02,
              ),
              Text(
                "Login",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.06,
              ),
              TextField(
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: w / 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: w * 0.01, vertical: h * 0.02),
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
              ),
              SizedBox(
                height: h * 0.02,
              ),
              TextField(
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: w / 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: w * 0.01, vertical: h * 0.02),
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
                    Icons.key,
                    size: w / 18,
                    color: Colors.grey.shade200,
                  ),
                  hintText: 'Password',
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: w / 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.10,
              ),
              Row(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
