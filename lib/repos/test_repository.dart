import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:personality_test/models/test_questions.dart';

class TestRepository {
  Future<TestQuestion> getTextQuestion(int index) async {
    String data = await rootBundle.loadString('assets/sample_data.json');
    var jsonResult = json.decode(data);
    List<TestQuestion> testQuestions = testQuestionFromJson(data);
    return testQuestions[index];
  }
}
