import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
              clientId:
                  '463054530843-u34cf4lh6dfbsjer1dfd7d89uilh4d5b.apps.googleusercontent.com')
          .signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredentialResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return print(userCredentialResult.user);
      // return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      debugPrint('err SigninWIthGoogle $e');
      return null;
    }
  }
}
