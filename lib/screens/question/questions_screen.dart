import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/model/question_step.dart';
import 'dart:async';

import 'package:test_app/model/step_option.dart';
import 'package:test_app/screens/result/result_screen.dart';

import '../../dal/http_repository.dart';
import '../widgets/show_toast.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentStepIndex = 0;
  int totalScore = 0;
  Timer? timer;
  int timeRemaining = 0;
  List<QuestionStep> steps = [];

  @override
  void initState() {
    super.initState();
    _fetchQuestions();
  }

  void _startStep() {
    if (currentStepIndex < steps.length) {
      final currentStep = steps[currentStepIndex];
      timeRemaining = currentStep.timeLimit;
      timer?.cancel();
      timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        if (timeRemaining <= 0) {
          t.cancel();
          _onOptionSelected(null);
        } else {
          setState(() {
            timeRemaining--;
          });
        }
      });
    }
  }

  void _onOptionSelected(StepOption? option) {
    timer?.cancel();
    if (option != null) {
      totalScore += option.score;
    }
    if (currentStepIndex < steps.length - 1) {
      setState(() {
        currentStepIndex++;
      });
      _startStep();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(score: totalScore),
        ),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (steps.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final currentStep = steps[currentStepIndex];
    return Scaffold(
      appBar: AppBar(title: const Text("Test")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              currentStep.questionTitle,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text("Time remaining: $timeRemaining seconds",
                style: const TextStyle(fontSize: 16, color: Colors.red)),
            const SizedBox(height: 20),
            ...currentStep.options.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ElevatedButton(
                  onPressed: () => _onOptionSelected(option),
                  child: Text(option.text),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Future<void> _fetchQuestions() async {
    try {
      final HttpRepository httpRepository =
          Provider.of<HttpRepository>(context, listen: false);
      final List<QuestionStep> response = await httpRepository.fetchQuestions();
      setState(() {
        steps = response;
      });
      if (steps.isNotEmpty) {
        _startStep();
      }
    } catch (error) {
      showToast(color: Colors.redAccent, msg: error.toString());
    }
  }
}
