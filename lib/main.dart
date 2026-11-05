
import 'package:flutter/material.dart';
import 'package:flutter_base/login.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const StudyMateApp());
}

class StudyMateApp extends StatelessWidget {
  const StudyMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudyMate',

      theme: ThemeData(
        primaryColor: const Color(0xFF263B80),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),

      home: const LoginPage(),
    );
  }
}




