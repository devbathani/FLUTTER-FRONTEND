import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final recorder = AudioRecorder();
  int secondsLeft = 60;
  late Timer timer;
  double recordContainerWidth = 0.0;
  String? audioFilePath;
  String formatSeconds(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String formattedTime =
        '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    return formattedTime;
  }

  final audioPlayer = AudioPlayer();
  void startTimer(BuildContext context) {
    secondsLeft = 60;
    recordContainerWidth = 0.0;

    double screenWidth = MediaQuery.of(context).size.width;
    double unitWidth =
        screenWidth / 60; // Dividing the screen width by total seconds

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft > 0) {
        secondsLeft--;
        recordContainerWidth += unitWidth; // Increase width proportionally
        setState(() {});
      } else {
        timer.cancel();
        stopRecording();
        setState(() {});
      }
    });
  }

  void startRecording(BuildContext context) async {
    startTimer(context);
    setState(() {});
    // Check and request permission if needed
    if (await recorder.hasPermission()) {
      // Get the directory for storing application files
      final directory = await getApplicationDocumentsDirectory();
      const encoder = AudioEncoder.aacLc;
      const config = RecordConfig(encoder: encoder, numChannels: 1);
      recorder.start(config, path: '${directory.path}/recording.m4a');
      setState(() {});
    }
  }

  void stopRecording() async {
    await recorder.stop().then(
      (value) async {
        timer.cancel();
        audioFilePath = value;

        await audioPlayer.play(DeviceFileSource(value!));
        setState(() {});
      },
    );

    recorder.dispose(); // As always, don't forget this one.
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffEB3349),
              Color(0xffF45C43),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    "Click to record audio",
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
            const SizedBox(height: 50),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: 3,
              width: recordContainerWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 20),
            secondsLeft == 60
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      formatSeconds(secondsLeft),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
            const SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                2,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InkWell(
                      onTap: () {
                        index == 0 ? startRecording(context) : stopRecording();
                      },
                      child: Container(
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            index == 0 ? "Record" : "Stop",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
