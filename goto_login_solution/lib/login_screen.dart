import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goto_login_solution/otp_screen.dart';
import 'package:goto_login_solution/widgets/common_button.dart';
import 'package:otpless_flutter/otpless_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  final _otplessFlutterPlugin = Otpless();

  @override
  void initState() {
    _otplessFlutterPlugin.initHeadless("GYAZZUKY316G1H8ZOGFC");
    _otplessFlutterPlugin.setHeadlessCallback(onHeadlessResult);
    super.initState();
  }

  void onHeadlessResult(dynamic result) {
    setState(() {
      print(result);
    });
  }

  void sendOtp() {
    if (phoneNumberController.text.isEmpty) {
      print("phone number required");
    } else {
      Map<String, dynamic> arg = {};
      arg["phone"] = phoneNumberController.text;
      arg["countryCode"] = "+91";
      _otplessFlutterPlugin.startHeadless(onHeadlessResult, arg);
      Navigator.push(context, MaterialPageRoute(builder: (_) => const OtpScreen()));
    }
  }

  void socialLogin(String channel) {
    Map<String, dynamic> arg = {'channelType': channel};
    _otplessFlutterPlugin.startHeadless(onHeadlessResult, arg);
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
                    controller: phoneNumberController,
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
                      hintText: "Phone number",
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
                      sendOtp();
                    },
                    child: const CommonButton(text: "Sign In"),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) {
                        return InkWell(
                          onTap: () {
                            index == 0
                                ? socialLogin("FACEBOOK")
                                : index == 1
                                    ? socialLogin("GMAIL")
                                    : index == 2
                                        ? socialLogin("APPLE")
                                        : socialLogin("WHATSAPP");
                          },
                          child: SvgPicture.asset(
                            index == 0
                                ? "assets/icons/facebook.svg"
                                : index == 1
                                    ? "assets/icons/google.svg"
                                    : index == 2
                                        ? "assets/icons/apple.svg"
                                        : "assets/icons/whatsapp.svg",
                            height: 30,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
