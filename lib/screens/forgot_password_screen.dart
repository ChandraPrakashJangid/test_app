import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../dal/api_client.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final Dio _dio = Dio();
  late ApiClient _apiClient;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _apiClient = ApiClient(_dio);
  }

  Future<void> _resetPassword() async {
    setState(() => _isLoading = true);
    try {
      await _apiClient.forgotPassword({
        "email": _emailController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reset email sent')),
      );
      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Enter your email'),
            ),
            const SizedBox(height: 20),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: _resetPassword,
                child: const Text('Reset Password'),
              ),
          ],
        ),
      ),
    );
  }
}
