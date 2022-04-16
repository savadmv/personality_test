import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget{
  final String message;
  const ResultScreen({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Center(child: Text(message));
  }
}