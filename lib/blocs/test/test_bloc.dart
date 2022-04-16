import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:personality_test/models/test_questions.dart';
import 'package:personality_test/repos/test_repository.dart';

part 'test_event.dart';

part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<GetQuestions>((event, emit) async {
      await getQuestion(event, emit);
    });
    on<NextQuestion>((event, emit) async {
      await nextQuestion(event, emit);
    });
    on<PrevQuestion>((event, emit) async {
      await prevQuestion(event, emit);
    });
  }

  Future<void> getQuestion(GetQuestions event, Emitter<TestState> emit) async {
    emit(Processing());
    TestQuestion testQuestion = await TestRepository().getTextQuestion(0);
    emit(QuestionLoaded(testQuestion, 0, 0));
  }

  Future<void> nextQuestion(NextQuestion event, Emitter<TestState> emit) async {
    emit(Processing());

    if (event.index == 5) {
      if (event.proPoint > 0) {
        emit(const TestFinished(
            "You are an introvert \n That's okay ! That's normal "));
      }
      if (event.proPoint < 0) {
        emit(const TestFinished(
            "You are an extrovert  \n That's okay ! That's normal"));
      }
    } else {
      TestQuestion testQuestion =
      await TestRepository().getTextQuestion(event.index);
      emit(QuestionLoaded(testQuestion, event.proPoint, event.index));
    }
  }

  Future<void> prevQuestion(PrevQuestion event, Emitter<TestState> emit) async {

    if (event.index>0) {
      emit(Processing());
      TestQuestion testQuestion =
          await TestRepository().getTextQuestion(event.index);
      
      emit(QuestionLoaded(testQuestion, event.proPoint, event.index));
    }
  }
}
