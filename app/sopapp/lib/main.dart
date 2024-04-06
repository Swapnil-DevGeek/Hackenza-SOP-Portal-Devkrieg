import 'package:flutter/material.dart';
import 'package:sopapp/screens/admin/admin_dash.dart';
import 'package:sopapp/screens/faculty/faculty_dash.dart';
import 'package:sopapp/screens/login.dart';
import 'package:sopapp/screens/student/student_dash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme : ThemeData.dark(),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: FacultyDashboard(),
    );
  }
}
