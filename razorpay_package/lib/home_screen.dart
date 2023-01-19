import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Razorpay razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    setupPay();
  }

  void setupPay() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
        (PaymentSuccessResponse response) {
      // Do something when payment succeeds
      log("Payment Done");
    });
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
        (PaymentFailureResponse response) {
      // Do something when payment fails
      log("Payment Fail");
    });
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
        (ExternalWalletResponse response) {
      // Do something when an external wallet is selected
    });
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
              Color(0xff8A2387),
              Color(0xffE94057),
              Color(0xffF27121),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    "Click to pay from Razorpay",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            InkWell(
              onTap: () async {
                var options = {
                  'key': "rzp_test_4qGWB3dkcHmRZT",
                  'amount': 100 * 100,
                  'name': 'Dev Bathani',
                  'description': 'service payment',
                  'timeout': 300,
                  'prefill': {
                    'contact': '7202897611',
                    'email': 'bathanid888@gmail.com'
                  }
                };

                razorpay.open(options);
              },
              child: Container(
                height: 50,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Pay",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
