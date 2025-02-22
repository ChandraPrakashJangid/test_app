import 'package:json_annotation/json_annotation.dart';

part 'step_option.g.dart';

@JsonSerializable()
class StepOption {
  final String text;
  final int score;
  StepOption({
    required this.text,
    required this.score,
  });

  factory StepOption.fromJson(Map<String, dynamic> json) =>
      _$StepOptionFromJson(json);

  Map<String, dynamic> toJson() => _$StepOptionToJson(this);
}
