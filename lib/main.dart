// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:quizapp/log_sign.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark().copyWith(),
      home: const LoginPage(),
    );
  }
}
