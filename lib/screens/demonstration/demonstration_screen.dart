import 'package:flutter/material.dart';

class DemonstrationScreen extends StatefulWidget {
  const DemonstrationScreen({super.key});

  @override
  State<DemonstrationScreen> createState() => _DemonstrationScreenState();
}

class _DemonstrationScreenState extends State<DemonstrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demonstration")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Welcome to the demonstration round. Are you ready to begin?",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "question_screen");
              },
              child: Text("Start Test"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            )
          ],
        ),
      ),
    );
  }
}
