import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:types_of_login_pages/Ui/widgets/login_button.dart';
import 'package:types_of_login_pages/Ui/widgets/password_textfield.dart';
import 'package:types_of_login_pages/Ui/widgets/username_textfield.dart';

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
              UsernameTextField(),
              SizedBox(
                height: h * 0.02,
              ),
              PasswordTextField(),
              SizedBox(
                height: h * 0.10,
              ),
              LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
