import 'package:flutter/material.dart';
import 'package:sopapp/screens/admin/admindash.dart';
import 'package:sopapp/screens/login.dart';
import 'package:sopapp/screens/student/studentdash.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AdminDashboard(),
    );
  }
}
