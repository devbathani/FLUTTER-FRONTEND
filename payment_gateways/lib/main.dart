import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_gateways/home_screen.dart';

void main() {
  Stripe.publishableKey =
      "YOUR_PUBLIC_KEY";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Payment Gateways',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
