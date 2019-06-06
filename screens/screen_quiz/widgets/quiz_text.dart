import 'package:flutter/material.dart';
import '../styles/styles.dart' as styles;

class QuizTextField extends StatefulWidget {
  @override
  _QuizTextFieldState createState() => _QuizTextFieldState();
}

class _QuizTextFieldState extends State<QuizTextField> {
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
                child: Text("Interests", style: styles.styleTransport()),
              ),
            ),
            isThreeLine: false,
            subtitle: new TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: "Sightseeing, Sports, Coffee, etc..."
              ),
            )
          ),
        ),
      );
  }
}