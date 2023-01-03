import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:otpless_login/home_screen.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String launchWhatsAppUrl = '';
  StreamSubscription? _sub;

  Future<String> getLoginUrl() async {
    final url = Uri.parse("https://api.otpless.com/api/v1/user/getSignupUrl");
    final header = {
      'clientid': 'OTPLess:YEOCWAWXQCYEDXLGHEREYGIAEPIVCOYF',
      'clientsecret':
          'Kf4y6dYW9u0dDGsGXY55b6Y7GqBe2cx1SL09n5BdvOVhWnhHeCZohPNNUGKTPq0ua'
    };
    final response = await http.get(url, headers: header);
    launchWhatsAppUrl = jsonDecode(response.body)['url'];
    log("WhatsApp launch url : $launchWhatsAppUrl");
    return launchWhatsAppUrl;
  }

  @override
  void initState() {
    super.initState();
    initializeUrl();
  }

  @override
  void dispose() {
    _sub!.cancel();
    super.dispose();
  }

  initializeUrl() {
    _sub = uriLinkStream.listen(
      (Uri? uri) {
        if (uri!.path == '/whatsapp/login') {
          String? token = uri.queryParameters['token'];
          if (token != null) {
            log("Token: $token");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const HomeScreen(),
              ),
            );
          }
        }
      },
      onError: (err) {
        log(err);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff73c8a9),
              Color(0xffffffff),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            const Text(
              "Login via WhatsApp",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            InkWell(
              onTap: () async {
                final url = await getLoginUrl();
                launchUrlString(url);
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff73c8a9),
                ),
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
