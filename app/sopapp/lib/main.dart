import 'package:flutter/material.dart';
import 'package:sopapp/screens/faculty/faculty_dash.dart';
import 'package:sopapp/screens/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sopapp/screens/student/myapplications.dart';
import 'package:sopapp/screens/student/student_dash.dart';
import 'firebase_options.dart';
// import 'package:sopapp/screens/admin/admin_dash.dart';
// import 'package:sopapp/screens/faculty/faculty_dash.dart';
// import 'package:sopapp/screens/login.dart';
// import 'package:sopapp/screens/student/student_dash.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SignInScreen(),
      theme: ThemeData.light(),
    );
  }
}
