import "package:flutter/material.dart";

class Answer extends StatelessWidget {
  final VoidCallback buttonClickHandler;
  final String optionText;
  Answer(this.buttonClickHandler, this.optionText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      // padding: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        /** // This is the alternate code for above mentioned Elevated Button styling.
        * style: ElevatedButton.styleFrom(
        *  primary: Colors.amber, // this is the color for button padding.
        *  onPrimary: Colors.white // this is the color for text.
        * )
        */
        child: Text(optionText),
        onPressed: buttonClickHandler,
      ),
    );
  }
}
