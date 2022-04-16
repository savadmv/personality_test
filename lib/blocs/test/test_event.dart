part of 'test_bloc.dart';

abstract class TestEvent extends Equatable {
  const TestEvent();
}

class GetQuestions extends TestEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NextQuestion extends TestEvent {
  final int index;
  final int proPoint;

  const NextQuestion(this.index, this.proPoint);

  @override
  // TODO: implement props
  List<Object?> get props => [index, proPoint];
}

class PrevQuestion extends TestEvent {
  final int index;
  final int proPoint;

  const PrevQuestion(this.index, this.proPoint);

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
