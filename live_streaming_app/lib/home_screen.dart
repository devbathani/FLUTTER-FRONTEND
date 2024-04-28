import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:live_streaming_app/meeting_screen.dart';
import 'package:videosdk/videosdk.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? meetingId;
  TextEditingController roomIdController = TextEditingController();
  //Auth token we will use to generate a meeting and connect to it
  //Get this token from https://www.videosdk.live/
  String token = 'YOUR_TOKEN';
  Future createMeetingRoom() async {
    // API call to create meeting
    final http.Response httpResponse = await http.post(
      Uri.parse("https://api.videosdk.live/v2/rooms"),
      headers: {'Authorization': token},
    );

    //Destructuring the roomId from the response
    meetingId = jsonDecode(httpResponse.body)['roomId'];
    roomIdController.text = meetingId!;
    setState(() {});
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
              Color(0xffEAECC6),
              Color(0xff2BC0E4),
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
              "Live Streaming Demo App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 150),
            Text(
              meetingId ?? "Meeting Id",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    createMeetingRoom();
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
                        "Create Room",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Join Room'),
                          content: TextField(
                            decoration: const InputDecoration(
                              labelText: 'Enter Room ID',
                            ),
                            controller: roomIdController,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ILSScreen(
                                      meetingId:
                                          meetingId ?? roomIdController.text,
                                      token: token,
                                      mode: Mode.VIEWER,
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Join as Viewer'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ILSScreen(
                                      meetingId: meetingId!,
                                      token: token,
                                      mode: Mode.CONFERENCE,
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Join as Host'),
                            ),
                          ],
                        );
                      },
                    );
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
                        "Join Room",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
