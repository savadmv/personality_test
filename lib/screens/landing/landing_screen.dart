import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personality_test/blocs/test/test_bloc.dart';
import 'package:personality_test/screens/test_screen/test_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TestBloc>(
      create: (context) => TestBloc()..add(GetQuestions()),
      child: const TestScreen(),
    );
  }
}
