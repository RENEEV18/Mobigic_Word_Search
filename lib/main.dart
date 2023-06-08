import 'package:flutter/material.dart';
import 'package:mobigic_test_apk/controller/home_controller/home_controller.dart';
import 'package:mobigic_test_apk/controller/search_controller/search_controller.dart';
import 'package:mobigic_test_apk/controller/splash_controller/splash_controller.dart';
import 'package:mobigic_test_apk/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchBoxController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
