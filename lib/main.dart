import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster_draft2/home.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Urbanist'),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // super.initState();
    // Set a timer to navigate to the Home page after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => Home(), transition: Transition.downToUp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 255, 214, 1)),
        child: const Image(
          image: AssetImage('assets/images/Tripster-logo.png'),
        ),
      ),
    );
  }
}
