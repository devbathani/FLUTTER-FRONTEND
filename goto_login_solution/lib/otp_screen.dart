import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goto_login_solution/home_screen.dart';
import 'package:goto_login_solution/widgets/common_button.dart';
import 'package:otpless_flutter/otpless_flutter.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  final _otplessFlutterPlugin = Otpless();
  void verifyOtp() {
    Map<String, dynamic> arg = {};
    arg["phone"] = "7202897611";
    arg["countryCode"] = "+91";
    arg["otp"] = otpController.text;
    _otplessFlutterPlugin.startHeadless(onHeadlessResult, arg);
  }

  void onHeadlessResult(dynamic result) {
    setState(() {
      print(result);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            SvgPicture.asset("assets/background.svg"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    "Login here",
                    style: TextStyle(
                      color: Color(0xff1F41BB),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome back you’ve \nbeen missed!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 60),
                  TextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Color(0xff626262),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffF1F4FF),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff1F41BB),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff1F41BB),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "OTP",
                      hintStyle: const TextStyle(
                        color: Color(0xff626262),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      verifyOtp();
                    },
                    child: const CommonButton(text: "Verify"),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
