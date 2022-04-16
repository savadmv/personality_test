part of 'test_bloc.dart';

abstract class TestState extends Equatable {
  const TestState();
}

class TestInitial extends TestState {
  @override
  List<Object> get props => [];
}

class Processing extends TestState {
  @override
  List<Object> get props => [];
}

class QuestionLoaded extends TestState {
  final TestQuestion question;
  final int totalPoint;
  final int index;

  const QuestionLoaded(this.question, this.totalPoint, this.index);

  @override
  List<Object> get props => [question];
}

class TestFinished extends TestState {
  final String message;

  const TestFinished(this.message);

  @override
  List<Object> get props => [message];
}
