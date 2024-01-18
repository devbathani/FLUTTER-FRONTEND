import 'dart:async';
import 'dart:math';

import 'package:countdown_theme_app/timer_text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime targetDateTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    // Set your target date and time
    targetDateTime = generateRandomDateTime();

    // Start the timer
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {});
    });
  }

  DateTime generateRandomDateTime() {
    final random = Random();
    final now = DateTime.now();
    final randomDays =
        random.nextInt(365); // Random value between 0 and 365 days
    final randomTime = now.add(Duration(days: randomDays));
    return DateTime(
      randomTime.year,
      randomTime.month,
      randomTime.day,
      random.nextInt(24), // Random value between 0 and 23 hours
      random.nextInt(60), // Random value between 0 and 59 minutes
      random.nextInt(60), // Random value between 0 and 59 seconds
    );
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Duration remainingTime = targetDateTime.difference(DateTime.now());
    String years = (remainingTime.inDays ~/ 365).toString().padLeft(2, '0');
    String months =
        ((remainingTime.inDays % 365) ~/ 30).toString().padLeft(2, '0');
    String days = (remainingTime.inDays % 30).toString().padLeft(2, '0');
    String hours = (remainingTime.inHours % 24).toString().padLeft(2, '0');
    String minutes = (remainingTime.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (remainingTime.inSeconds % 60).toString().padLeft(2, '0');

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images.png"),
                  const SizedBox(height: 30),
                  TimerTextWidget(
                    time: years,
                    fontColor: Colors.red,
                    fontSize: 55,
                    timeFormat: "YRS",
                    timeFormatFontSize: 20,
                  ),
                  const SizedBox(height: 10),
                  TimerTextWidget(
                    time: months,
                    fontColor: Colors.red,
                    fontSize: 55,
                    timeFormat: "MTH",
                    timeFormatFontSize: 20,
                  ),
                  const SizedBox(height: 10),
                  TimerTextWidget(
                    time: days,
                    fontColor: Colors.white,
                    fontSize: 55,
                    timeFormat: "DAY",
                    timeFormatFontSize: 20,
                  ),
                  const SizedBox(height: 10),
                  TimerTextWidget(
                    time: hours,
                    fontColor: Colors.white,
                    fontSize: 55,
                    timeFormat: "HRS",
                    timeFormatFontSize: 20,
                  ),
                  const SizedBox(height: 10),
                  TimerTextWidget(
                    time: minutes,
                    fontColor: Colors.white,
                    fontSize: 55,
                    timeFormat: "MIN",
                    timeFormatFontSize: 20,
                  ),
                  const SizedBox(height: 10),
                  TimerTextWidget(
                    time: seconds,
                    fontColor: Colors.white,
                    fontSize: 55,
                    timeFormat: "SEC",
                    timeFormatFontSize: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
