import "package:flutter/material.dart";

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

// Single line function syntax
// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

// "_" before any name
class _MyAppState extends State<MyApp> {
  int _count = 0;
  int _totalScore = 0;

  void resetHandler() {
    setState(() {
      _count = 0;
    });
    _totalScore = 0;
  }

  var _questions = [
    {
      "question": "What\'s your favourite color?",
      "options": [
        {"text": "Blue", "score": 10},
        {"text": "Black", "score": 3},
        {"text": "White", "score": 5},
        {"text": "Green", "score": 7}
      ],
    },
    {
      "question": "What's your favourite animal?",
      "options": [
        {"text": "Lion", "score": 10},
        {"text": "Rabbit", "score": 3},
        {"text": "Chameleon", "score": 5},
        {"text": "Elephant", "score": 7}
      ],
    },
    {
      "question": "Who's your favourite actor?",
      "options": [
        {"text": "Dhanush", "score": 10},
        {"text": "Jr. N.T.R", "score": 3},
        {"text": "Vijay Sethupathi", "score": 5},
        {"text": "Fahad Fassil", "score": 7}
      ],
    },
  ];

  void buttonClicked(int score) {
    _totalScore += score;
    setState(() {
      _count++;
    });
    print("Button Clicked..!");
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Rap"),
        ),
        body: _count < _questions.length
            ? Quiz(
                questions: _questions,
                count: _count,
                optionClickHandler: buttonClicked)
            : Result(resetHandler, _totalScore),
      ),
    );
  }
}

