import 'package:flutter/material.dart';
import 'widgets/quiz_slider.dart';
import 'widgets/quiz_transport.dart';
import 'widgets/quiz_text.dart';
import 'widgets/quiz_text_location.dart';

//TODO: BUG. If listview is scrollable, will detect if user wants to scroll first
//before detecting if on the slider widget. Will call onChangeEnd on slider twice.
//fix? set list to not scrollable,
//hack make a bool and only made onchage end run on second time.

class QuizPage extends StatefulWidget {
  QuizPage({
    Key key,
  }) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String ageValue = "";
  String budgetValue = "";
  Map<String,bool> transportValues =
  {
      "canWalk": false,
      "canBike": false,
      "canCar": false,
      "canBus": false,
      "canTrain": false,
    };

  Map<String,dynamic>buildJson = new Map<String,dynamic>();
  

    @override
  void initState() {
    super.initState();
  }

  //Conditions before the user can press the submit button.
  bool canSubmit(){
    if(ageValue != "" && budgetValue != ""){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wotsay"),
          backgroundColor: Colors.grey.shade300,
          //Back button------
          leading: new InkWell(
            customBorder: CircleBorder(),
            child: Icon(
              Icons.keyboard_backspace,
            ),
            splashColor: Colors.pink.shade200,
            onTap: () {
              print("inkwellpressed");
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
                child: Icon(Icons.perm_identity),
              ),
              splashColor: Colors.pink.shade200,
              onTap: () {
                print("inkwellpressed");
              },
            ),
          ],
        ),

        body: new ListView(
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
                new QuizTransport(onChange: (selectedTransports){
                  setState(() {
                   transportValues = selectedTransports; 
                  });
                },),

                //Interests Textfield
                new QuizTextField(),

                //Locations Textfield
                new QuizTextFieldLocation(),



                
                //A done button.
                
                new RaisedButton(
                  child: Text("Submit"),
                  onPressed: canSubmit() ?(){
                    print("Age: " + ageValue);
                    print("Budget: " + budgetValue);
                    print(transportValues);


                    buildJson["Age"] = ageValue;
                    buildJson["Budget"] = budgetValue;
                    buildJson["Transport"] = transportValues;

                    print(buildJson);
                    
                  } : null,
                )
              ],
            ),
          ],
        ));
  }
}
