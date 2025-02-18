import 'package:flutter/material.dart';
import 'package:test_app/screens/forgot_password_screen.dart';
import 'package:test_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Candidate Test Experience',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/forgot_password': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}
