import 'package:flutter/material.dart';
import 'widgets/quiz_slider.dart';
import 'widgets/quiz_transport.dart';
import 'widgets/quiz_text.dart';
import 'widgets/quiz_text_location.dart';
import '../screen_events/screen_events.dart';

//TODO: BUG. If listview is scrollable, will detect if user wants to scroll first
//before detecting if on the slider widget. Will call onChangeEnd on slider twice.
//fix? set list to not scrollable,
//hack make a bool and only made onchage end run on second time.

class QuizScreen extends StatefulWidget {
  QuizScreen({
    Key key,
  }) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String ageValue = "";
  String budgetValue = "";
  Map<String, bool> transportValues = {
    "canWalk": false,
    "canBike": false,
    "canCar": false,
    "canBus": false,
    "canTrain": false,
  };


  Map<String, dynamic> buildJson = new Map<String, dynamic>();

  @override
  void initState() {
    super.initState();
  }



//When Backbutton on appbar is pressed
  _appBarBackPressed() {
    //Navigator pop?
  }

  //When Profile on appbar is pressed
  _appBarProfilePressed() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PickEventScreen(location: "Canberra")));

  }


  //Conditions before the user can press the submit button.
  bool _canSubmit() {
    if (ageValue != "" && budgetValue != "") {
      return true;
    }
    return false;
  }
//If user fulfills conditions, can submit the values/ build a json for posting.
  _submitButtonPressed() {
            print("Age: " + ageValue);
            print("Budget: " + budgetValue);
            print(transportValues);

            buildJson["Age"] = ageValue;
            buildJson["Budget"] = budgetValue;
            buildJson["Transport"] = transportValues;
            print(buildJson);

            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PickEventScreen(location: "TEST")));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Title Wotsay
        title: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
            children: <TextSpan>[
              TextSpan(text: "Wot", style: TextStyle(color: Colors.pink.shade300)),
              TextSpan(text: "say", style: TextStyle(color: Colors.green.shade300)),
            ],
          ),
        ),
        backgroundColor: Colors.amber.shade300,
        //Back button------
        leading: new InkWell(
          customBorder: CircleBorder(),
          child: Icon(
            Icons.keyboard_backspace,
            color: Colors.green.shade400,
          ),
          splashColor: Colors.pink.shade200,
          onTap: () {
            _appBarBackPressed();
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          //My profile??------------
          new InkWell(
            customBorder: CircleBorder(),
            borderRadius: BorderRadius.circular(5.0),
            child: new Container(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.perm_identity,
              color: Colors.green.shade400,
              ),
            ),
            splashColor: Colors.pink.shade200,
            onTap: () {
              _appBarProfilePressed();
            },
          ),
        ],
      ),
      //Wrap page in gesture detector to dismiss keyboard when tapping on page that
      //isnt a textfield
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: new ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Age Slider--------
                new QuizSlider(
                  onChangeEnd: (selectedAge) {
                    setState(() {
                      ageValue = selectedAge;
                    });
                  },
                  sliderMin: 3,
                  sliderMax: 100,
                  title: (ageValue == ""
                      ? "Select your age"
                      : "Age : " + ageValue),
                ),
                //Budget Slider-------
                new QuizSlider(
                  onChangeEnd: (selectedBudget) {
                    setState(() {
                      budgetValue = selectedBudget;
                    });
                  },
                  sliderMin: 100,
                  sliderMax: 10000,
                  //sets the popup bubble to show increments of 100.
                  //100~/100 is the same as 100/100.toInt()
                  sliderDivisions: ((10000 - 100) ~/ 100),
                  title: (budgetValue == ""
                      ? "Select your budget"
                      : "Budget : \$" + budgetValue),
                ),

                //Transport button bar
                new QuizTransport(
                  onChange: (selectedTransports) {
                    setState(() {
                      transportValues = selectedTransports;
                    });
                  },
                ),

                //Interests Textfield
                new QuizTextField(),

                //Locations Textfield
                new QuizTextFieldLocation(),

                //A submit button.
                new RaisedButton(
                  child: Text("Submit"),
                  onPressed: _canSubmit() ? (){_submitButtonPressed();} : null,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
