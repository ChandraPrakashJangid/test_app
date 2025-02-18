import 'package:flutter/material.dart';
import 'package:test_app/screens/login/widgets/login_form.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: const LoginForm(),
      ),
    );
  }
}
