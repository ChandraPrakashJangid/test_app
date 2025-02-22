import 'package:test_app/model/question_step.dart';
import 'package:test_app/model/step_option.dart';

class QuestionsHelper {
  static final List<QuestionStep> steps = [
    QuestionStep(
      questionTitle: "Question 1: What is your preferred communication style?",
      options: [
        StepOption(text: "Direct", score: 10),
        StepOption(text: "Indirect", score: 0),
      ],
      timeLimit: 10,
    ),
    QuestionStep(
      questionTitle: "Question 2: How do you approach problem-solving?",
      options: [
        StepOption(text: "Analytical", score: 10),
        StepOption(text: "Creative", score: 5),
        StepOption(text: "Practical", score: 0),
      ],
      timeLimit: 12,
    ),
    QuestionStep(
      questionTitle: "Question 3: What motivates you in a work environment?",
      options: [
        StepOption(text: "Recognition", score: 5),
        StepOption(text: "Challenge", score: 10),
        StepOption(text: "Stability", score: 0),
      ],
      timeLimit: 10,
    ),
    QuestionStep(
      questionTitle: "Question 4: How do you handle conflicts?",
      options: [
        StepOption(text: "Confront", score: 10),
        StepOption(text: "Avoid", score: 0),
        StepOption(text: "Mediated", score: 5),
      ],
      timeLimit: 15,
    ),
    QuestionStep(
      questionTitle: "Question 5: Which option best describes your leadership style?",
      options: [
        StepOption(text: "Authoritative", score: 10),
        StepOption(text: "Democratic", score: 5),
        StepOption(text: "Laissez-faire", score: 0),
      ],
      timeLimit: 12,
    ),
  ];

  QuestionsHelper._();
}
