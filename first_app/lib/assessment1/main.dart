import "package:flutter/material.dart";

void main() => runApp(Assessment());

class Assessment extends StatefulWidget {
  @override
  State<Assessment> createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  String? outputText = "This is some random text.";
  void changeHandler() {
    setState(() {
      outputText = "This is the changed text";
    });
  }
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Assessment"),
          ),
          body: Column(
            children: <Widget>[
              Text(outputText!),
              ElevatedButton(
                child: Text("Change"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue, onPrimary: Colors.white),
                onPressed: changeHandler,
              )
            ],
          )),
    );
  }
}