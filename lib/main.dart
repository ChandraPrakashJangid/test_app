import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/screens/home/home_page.dart';
import 'package:test_app/screens/login/forgot_password_screen.dart';
import 'package:test_app/screens/login/login_screen.dart';
import 'package:test_app/screens/questions/demonstration_screen.dart';
import 'dal/http_repository.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<HttpRepository>(
          create: (_) => HttpRepository(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
        '/home_screen': (context) => const HomeScreen(),
        '/demonstration_screen': (context) => const DemonstrationScreen(),
      },
    );
  }
}