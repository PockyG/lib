import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../styles/styles.dart' as styles;

class QuizTransport extends StatefulWidget {

  final Function(Map<String,bool> val) onChange;


  QuizTransport({this.onChange});

  @override
  _QuizTransportState createState() => _QuizTransportState();

  
}

class _QuizTransportState extends State<QuizTransport> {
      Map<String,bool> transportValues = {
      "canWalk": false,
      "canBike": false,
      "canCar": false,
      "canBus": false,
      "canTrain": false,
    };


  

  @override
  Widget build(BuildContext context) {
    return Theme(
      // Find and Extend the parent theme using "copyWith".
      //Have to change button theme to change default size buttons
      data: Theme.of(context).copyWith(
        accentColor: Colors.yellow,
        buttonTheme: ButtonThemeData(
          minWidth: 50.0,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: new Card(
          child: new ListTile(
            title: new Center(
              child: new Container(
                padding: EdgeInsets.all(8.0),
                child: Text("Transport", style: styles.styleTransport()),
              ),
            ),
            isThreeLine: false,
            subtitle: new Container(
              padding: EdgeInsets.all(8.0),
              child: new Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,


                ///List of buttons
                children: <Widget>[
                  //Walking
                  new RaisedButton(
                    padding: EdgeInsets.all(8.0),
                    shape: CircleBorder(side: BorderSide.none),
                    child: Icon(Icons.directions_walk),
                    onPressed: () {
                      setState(() {
                        transportValues['canWalk']  = !transportValues['canWalk'];
                        this.widget.onChange(transportValues);
                        
                      });
                    },
                    color: transportValues['canWalk'] == true ? Colors.pink : Colors.grey.shade300,
                  ),
                  //Bike
                  new RaisedButton(
                    padding: EdgeInsets.all(8.0),
                    shape: CircleBorder(side: BorderSide.none),
                    child: Icon(Icons.directions_bike),
                    onPressed: () {
                      setState(() {
                        transportValues['canBike'] = !transportValues['canBike'];
                        this.widget.onChange(transportValues);
                      });
                    },
                    color: transportValues['canBike'] == true ? Colors.pink : Colors.grey.shade300,
                  ),
                  //Car
                  new RaisedButton(
                    padding: EdgeInsets.all(8.0),
                    shape: CircleBorder(side: BorderSide.none),
                    child: Icon(Icons.directions_car),
                    onPressed: () {
                      setState(() {
                        transportValues['canCar']  = !transportValues['canCar'];
                        this.widget.onChange(transportValues);
                      });
                    },
                    color: transportValues['canCar'] == true ? Colors.pink : Colors.grey.shade300,
                  ),
                  //Bus
                  new RaisedButton(
                    padding: EdgeInsets.all(8.0),
                    shape: CircleBorder(side: BorderSide.none),
                    child: Icon(Icons.directions_bus),
                    onPressed: () {
                      setState(() {
                        transportValues['canBus']  = !transportValues['canBus'];
                        this.widget.onChange(transportValues);
                      });
                    },
                    color: transportValues['canBus'] == true ? Colors.pink : Colors.grey.shade300,
                  ),
                  //Train
                  new RaisedButton(
                    padding: EdgeInsets.all(8.0),
                    shape: CircleBorder(side: BorderSide.none),
                    child: Icon(Icons.directions_subway),
                    onPressed: () {
                      setState(() {
                        transportValues['canTrain']  = !transportValues['canTrain'];
                        this.widget.onChange(transportValues);
                      });
                    },
                    color: transportValues['canTrain'] == true ? Colors.pink : Colors.grey.shade300,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
