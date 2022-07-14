import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final VoidCallback resetHandler;
  final int score;

  Result(this.resetHandler, this.score);

  // This is a getter method.
  String get resultPhrase {
    String resultText;
    if (score <= 9) {
      resultText = "Okay";
    } else if (score <= 12) {
      resultText = "Cool";
    } else if (score <= 15) {
      resultText = "Good";
    } else {
      resultText = "Great";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          Text(score.toString(),
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold)),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.amber,
              side: BorderSide(color: Colors.orange)
            ),
            child: Text("Reset"),
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
