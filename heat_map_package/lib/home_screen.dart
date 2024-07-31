import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<DateTime, int> dateMap = {};
  Random random = Random();
  // Define the start and end dates
  DateTime startDate = DateTime(2024, 1, 1);
  DateTime endDate = DateTime(2024, 12, 31);
  void addDateMap() {
    for (DateTime date = startDate;
        date.isBefore(endDate) || date.isAtSameMomentAs(endDate);
        date = date.add(const Duration(days: 1))) {
      // Randomly decide whether to skip this date
      bool shouldAdd = random.nextBool(); // 50% chance to skip or add
      if (shouldAdd) {
        // Assign a random value between 1 and 3 (inclusive)
        int randomValue = random.nextInt(3) + 1;
        dateMap[date] = randomValue;
      }
    }
  }

  @override
  void initState() {
    addDateMap();
    super.initState();
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
              Color(0xff0F2027),
              Color(0xff203A43),
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
                    "How to use Heat Map",
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
              height: 100,
            ),
            HeatMap(
              datasets: dateMap,
              startDate: DateTime(2024, 1, 1),
              endDate: DateTime(2024, 12, 31),
              textColor: Colors.white,
              defaultColor: const Color(0xff0F2027),
              colorMode: ColorMode.opacity,
              showText: false,
              scrollable: true,
              showColorTip: false,
              colorsets: {
                1: const Color(0xffFF375F),
                2: const Color(0xffED1147).withOpacity(0.80),
                3: const Color(0xffA8093A).withOpacity(0.70),
              },
            ),
          ],
        ),
      ),
    );
  }
}
