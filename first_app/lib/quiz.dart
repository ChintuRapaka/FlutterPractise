import "package:flutter/material.dart";
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int count;
  final Function optionClickHandler;
  Quiz(
      {required this.questions,
      required this.count,
      required this.optionClickHandler});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Question(
        questions[count]['question'] as String,
      ),
      ...(questions[count]['options'] as List<Map<String, Object>>).map((option) {
        return Answer(() => optionClickHandler(option["score"]), option["text"] as String);
      }).toList(),
    ]);
  }
}
