import 'dart:convert';

import 'package:fetch_api_demo/user_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  List<UserDataEntity>? userDataEntity;
  bool isLoading = true;

  Future<void> getUserData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      print("Fetched");
      setState(() {
        userDataEntity = (jsonDecode(response.body) as List)
            .map((e) => UserDataEntity.fromJson(e))
            .toList();
        isLoading = false;
      });
    } else {
      print("Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade700,
      body: SingleChildScrollView(
        child: isLoading
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 350,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  userDataEntity!.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 200,
                        color: Colors.white,
                        child: Center(
                          child: SizedBox(
                            width: 150,
                            child: Text(
                              userDataEntity![index].title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
