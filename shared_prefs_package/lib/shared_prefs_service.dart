import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharePrefsService {
  static var number;

  ///This function will save a particular Int value
  static Future<void> setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
    log("Number saved : $value");
  }

  ///This function will save a particular Int value
  static Future<void> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    number = prefs.getInt(key);
    log("number : $number");
    log("Number got : ${prefs.getInt(key)}");
  }
}
