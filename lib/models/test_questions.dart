// To parse this JSON data, do
//
//     final testQuestion = testQuestionFromJson(jsonString);

import 'dart:convert';

List<TestQuestion> testQuestionFromJson(String str) => List<TestQuestion>.from(
    json.decode(str).map((x) => TestQuestion.fromJson(x)));

String testQuestionToJson(List<TestQuestion> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestQuestion {
  TestQuestion({
    this.question,
    this.answers,
  });

  String? question;
  List<Answer>? answers;

  factory TestQuestion.fromJson(Map<String, dynamic> json) => TestQuestion(
        question: json["question "],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "question ": question,
        "answers": List<dynamic>.from(answers!.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    this.ans,
    this.introProPoint,
  });

  String? ans;
  int? introProPoint;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        ans:json["ans"],
        introProPoint: json["introProPoint"],
      );

  Map<String, dynamic> toJson() => {
        "ans": ans,
        "introProPoint": introProPoint,
      };
}



