import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vanilla/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff347fd5),
      body: Center(
        child: Image.asset('assets/img/logo.png'),
      ),
    );
  }
}
