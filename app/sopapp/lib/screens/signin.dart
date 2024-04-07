import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sopapp/screens/admin/admin_dash.dart';
import 'package:sopapp/screens/faculty/faculty_dash.dart';
import 'package:sopapp/screens/student/student_dash.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    return userCredential;
  }

  String gettoken()
  {
    _signInWithGoogle().then((userCredential) {
      userCredential.user!.getIdToken().then((token) {
        return token.toString();
      });
    });
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/campus.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/bits.png',
                  width: 200, // Adjust the width as desired
                  height: 200, // Adjust the height as desired
                ),
                SizedBox(height:20),
                ElevatedButton(
                  onPressed: () {
                    _signInWithGoogle().then((userCredential) {
                      userCredential.user!.getIdToken().then((token) {
                        return token;
                      });
                      if (userCredential.user != null &&
                          userCredential.user!.email!
                              .endsWith('@goa.bits-pilani.ac.in')) {
                        if (userCredential.user!.email!.startsWith('f20')) {
                          print(userCredential.user!);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentDashboard(
                                      token: gettoken(),
                                    )),
                          );
                        } else if (userCredential.user!.email ==
                            'divyanshsingh5nov2003@gmail.com') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminDashboard()),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FacultyDashboard()),
                          );
                        }
                      } else {
                        print('Invalid email');
                      }
                    }).catchError((error) {
                      print(error);
                      const Center(
                        child: Text('Error signing in'),
                      );
                    });
                  },
                  child: const Text('Sign In with Google'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
