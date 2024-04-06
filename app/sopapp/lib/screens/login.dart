import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  void _signInWithGoogle() async {
    try {
      // await googleSignIn.signIn();
      final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();

      // User signed in successfully, handle the authentication
      // and navigate to the next screen.
    } catch (error) {
      // Handle sign-in error.
      print("perror: " + error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Sign in with Google'),
          onPressed: _signInWithGoogle,
        ),
      ),
    );
  }
}
