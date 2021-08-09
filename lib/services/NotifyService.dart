import 'package:flutter/material.dart';

class NotifyService {
  static GlobalKey<ScaffoldMessengerState> messageKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String message) {
    final snackBar = SnackBar(
        content: Text(message,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20)));

    messageKey.currentState!.showSnackBar(snackBar);
  }
}
