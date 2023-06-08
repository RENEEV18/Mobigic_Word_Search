import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobigic_test_apk/view/home_screen/home_screen.dart';

class SplashController extends ChangeNotifier {
  void timerSplash(context) {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ),
        );
      },
    );
  }
}
