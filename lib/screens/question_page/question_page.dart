
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personality_test/blocs/test/test_bloc.dart';
import 'package:personality_test/models/test_questions.dart';

class QuestionPage extends StatefulWidget {
  final TestQuestion testQuestion;
  final int totalProPoint;
  final int index;

  const QuestionPage(
      {Key? key,
      required this.testQuestion,
      required this.totalProPoint,
      required this.index})
      : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(widget.testQuestion.question!,style: const TextStyle(color: Colors.black,fontWeight:FontWeight.w600,fontSize: 18),),
          ),

          ListView.builder(
              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.testQuestion.answers!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),side: BorderSide(color: index == selectedIndex?Colors.yellow:Colors.white,width: 2)),
                  selected:index == selectedIndex ,
                  selectedTileColor: Colors.black,
                  selectedColor: Colors.yellow,
                  trailing: index == selectedIndex?const Icon(Icons.done,color: Colors.yellow,size: 20,):const SizedBox(width: 12,height: 12,),
                  title: Text("${index+1}. ${widget.testQuestion.answers![index].ans}"),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration:const BoxDecoration(shape: BoxShape.circle,color: Colors.black),
                  child: Center(
                    child: IconButton(
                      enableFeedback: widget.index > 0,
                      disabledColor: Colors.yellow.withOpacity(0.5),
                      color: Colors.yellow,
                      onPressed: () {
                        int totalPint = widget.totalProPoint +
                            widget
                                .testQuestion.answers![selectedIndex].introProPoint!;
                        BlocProvider.of<TestBloc>(context)
                            .add(PrevQuestion(widget.index -1, totalPint));
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
                Container(
                  decoration:const BoxDecoration(shape: BoxShape.circle,color: Colors.black),
                  child: Center(
                    child: IconButton(
                      disabledColor: Colors.yellow.withOpacity(0.5),
                      enableFeedback: widget.index < 5,
                      color: Colors.yellow,
                      onPressed: () {
                        int totalPint = widget.totalProPoint +
                            widget
                                .testQuestion.answers![selectedIndex].introProPoint!;
                        BlocProvider.of<TestBloc>(context)
                            .add(NextQuestion(widget.index +1, totalPint));
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
