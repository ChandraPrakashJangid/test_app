import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/model/login_request.dart';

import '../../../dal/http_repository.dart';
import '../../../model/login_response.dart';
import '../../widgets/show_toast.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        final httpRepository =
            Provider.of<HttpRepository>(context, listen: false);
        LoginRequest request = LoginRequest(
            email: _emailController.text, password: _passwordController.text);
        final LoginResponse response = await httpRepository.login(loginRequest: request);
        if(response.errorMessage != null){
          showToast(color: Colors.redAccent, msg: response.errorMessage ?? "");
        }else{
          _navigateToHome();
        }
      } catch (error) {
        showToast(color: Colors.redAccent, msg: error.toString());
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  void _navigateToForgotPassword() {
    Navigator.pushNamed(context, '/forgot_password');
  }

  void _navigateToHome() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/home_screen',
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                    .hasMatch(value)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password cannot be empty';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
              ),
            TextButton(
              onPressed: _navigateToForgotPassword,
              child: const Text('Forgot Password?'),
            ),
          ],
        ),
      );
}
