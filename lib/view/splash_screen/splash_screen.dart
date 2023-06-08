import 'package:flutter/material.dart';
import 'package:mobigic_test_apk/controller/splash_controller/splash_controller.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SplashController>(context, listen: false)
          .timerSplash(context);
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "mobigic".toUpperCase(),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
