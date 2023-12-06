import 'package:flutter/material.dart';
import 'package:vanilla/editAcc_screen.dart';
import 'package:vanilla/home_screen.dart';
import 'package:vanilla/myAcc_screen.dart';
import 'package:vanilla/registration_screen.dart';
import 'package:vanilla/spash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'testing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF9F9F9),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Poppins'),
      home: const HomeScreen(),
    );
  }
}
