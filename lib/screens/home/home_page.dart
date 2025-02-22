import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Instructions")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Please tap on the button to start Questionnaire",
              style: const TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/demonstration');
              },
              child: const Text("Start Questionnaire"),
            ),
          ],
        ),
      ),
    );
  }
}
