import 'package:flutter/material.dart';
import '../styles/styles.dart' as styles;

class QuizTextFieldLocation extends StatefulWidget {
  @override
  _QuizTextFieldStateLocation createState() => _QuizTextFieldStateLocation();
}

class _QuizTextFieldStateLocation extends State<QuizTextFieldLocation> {
  var textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: new Card(
          child: new ListTile(
            title: new Center(
              child: new Container(
                padding: EdgeInsets.all(8.0),
                child: Text("Location", style: styles.styleTransport()),
              ),
            ),
            isThreeLine: false,
            subtitle: new TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: "Enter your location..."
              ),
            )
          ),
        ),
      );
  }
}