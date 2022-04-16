import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personality_test/blocs/test/test_bloc.dart';
import 'package:personality_test/screens/result_screen/result_screen.dart';

import '../question_page/question_page.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Personality test",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<TestBloc, TestState>(
          builder: (context, state) {
            if (state is Processing) {
              return const Center(child: Text("Getting Data"));
            }
            if (state is QuestionLoaded) {
              return QuestionPage(
                testQuestion: state.question,
                index: state.index,
                totalProPoint: state.totalPoint,
              );
            }
            if (state is TestFinished) {
              return ResultScreen(
                message: state.message,
              );
            }
            return const Center(child: Text("Getting Data"));
          },
        ),
      ),
    );
  }
}
