import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/model/step_option.dart';

part 'question_step.g.dart';

@JsonSerializable()
class QuestionStep {
  final String questionTitle;
  final List<StepOption> options;
  final int timeLimit;

  QuestionStep({
    required this.questionTitle,
    required this.options,
    required this.timeLimit,
  });

  factory QuestionStep.fromJson(Map<String, dynamic> json) =>
      _$QuestionStepFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionStepToJson(this);
}
