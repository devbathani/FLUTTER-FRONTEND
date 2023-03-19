import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:otpless_flutter/otpless_flutter.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _otplessFlutterPlugin = Otpless();

  // ** Function to initiate the login process
  void initiateWhatsappLogin(String intentUrl) async {
    var result =
        await _otplessFlutterPlugin.loginUsingWhatsapp(intentUrl: intentUrl);
    switch (result['code']) {
      case "581":
        print(result['message']);
        //TODO: handle whatsapp not found
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // ** Function that is called when page is loaded
  // ** We can check the auth state in this function
  Future<void> initPlatformState() async {
    _otplessFlutterPlugin.authStream.listen((token) {
      // TODO: Handle user token like storing in SharedPreferences or navigation
      log(token.toString());
    });
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
                  initiateWhatsappLogin(
                      "https://gauge.authlink.me?redirectUri=otpless://gauge");
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
