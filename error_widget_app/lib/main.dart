import 'dart:developer';

import 'package:error_widget_app/custom_error_widget.dart';
import 'package:error_widget_app/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    log(details.exceptionAsString());
    runApp(CustomErrorWidget(errorMessage: details.exceptionAsString()));
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Error Widget',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
