import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vanilla/blocs/course/course_bloc.dart';
import 'package:vanilla/blocs/course_excercise/course_excercise_bloc.dart';
import 'package:vanilla/firebase_options.dart';
import 'package:vanilla/repository/course/course_repository.dart';
import 'package:vanilla/spash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize firebase
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CourseBloc(courseRepository: CourseRepository())
            ..add(GetCourseListEvent(majorName: 'IPA')),
        ),
        BlocProvider(
          create: (context) =>
              CourseExcerciseBloc(courseRepository: CourseRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'testing',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFF9F9F9),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'Poppins'),
        home: SplashScreen(),
      ),
    );
  }
}
