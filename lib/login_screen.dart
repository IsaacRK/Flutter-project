import 'package:flutter/material.dart';
import 'package:vanilla/home_screen.dart';
import 'package:vanilla/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 32),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                      ),
                    ),
                    Image.asset('assets/img/login_img.png'),
                    const Text(
                      'Selamat Datang',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                    ),
                    const Text(
                      'Selamat Datang di Aplikasi Widya Edu\n Aplikasi Latihan dan Konsultasi Soal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color(0xff6a7483)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    LoginButton(
                      buttonColor: Colors.white,
                      textColor: Colors.black,
                      buttonTitle: 'Masuk dengan Google',
                      iconPath: 'assets/img/google_logo.png',
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                    ),
                    const SizedBox(height: 10),
                    LoginButton(
                      buttonColor: Colors.black,
                      textColor: Colors.white,
                      buttonTitle: 'Masuk dengan Apple',
                      iconPath: 'assets/img/apple_logo.png',
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
