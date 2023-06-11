import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:otpless_flutter/otpless_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // create a variable for otpless plugin by copy paste in your page
  final _otplessFlutterPlugin = Otpless();
// copy paste and call the below mentioned function to show otpless
// in your page
  String message = "";
  Future<void> startOtpless() async {
    _otplessFlutterPlugin.start((result) {
      if (result['data'] != null) {
        final token = result['data']['token'];
        message = "token: $token";
        log(message);
        _otplessFlutterPlugin.signInCompleted();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    //use this to remove floating Sign in button from OTPLESS
    _otplessFlutterPlugin.hideFabButton();
// use this to check whatsapp present in the user device
    _otplessFlutterPlugin.isWhatsAppInstalled();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  startOtpless();
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Login via WhatsApp",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
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
    );
  }
}
