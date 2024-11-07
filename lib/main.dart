
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}