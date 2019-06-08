import 'package:flutter/material.dart';
import '../../utils//testdata.dart' as testdata;
import '../../utils/utils.dart' as utils;
import '../../models/wot.dart';
import 'widgets/wot_event_item.dart';

class PickEventScreen extends StatefulWidget {
  final String location;

  @override
  _PickEventScreenState createState() => _PickEventScreenState();

  PickEventScreen({this.location});
}

class _PickEventScreenState extends State<PickEventScreen> {
  var data = testdata.testdata;

  List<Wot> wotList = new List<Wot>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade300,
          title: Text(
            this.widget.location,
            style: new TextStyle(color: Colors.green.shade300),
          ),
          actions: <Widget>[
            new RaisedButton(
              onPressed: () {
                setState(() {
                  wotList = utils.convertJsonToWotList(data);
                });
              },
              child: Text("test"),
            ),
            new RaisedButton(
              onPressed: () {
                setState(() {
                  wotList = utils.convertJsonToWotList(data);
                });
              },
              child: Text("api?"),
            ),
          ],
        ),
        body: new Stack(
          children: <Widget>[
            new Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    //Events list---------
                    child: wotList.length > 0
                        ? new ListView.builder(
                            itemCount: wotList.length,
                            itemBuilder: (BuildContext context, int index) {
                              Wot currentWot =  wotList[index];
                              return Dismissible(
                                // Show a red background as the item is swiped away
                                //background: Container(color: Colors.red),
                                key: Key(currentWot.wotId),
                                onDismissed: (direction) {
                                  setState(() {
                                    wotList.removeAt(index);
                                  });

                                  // Scaffold.of(context).showSnackBar(SnackBar(
                                  //     content: Text("dismissed")));
                                },
                                child: Container(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: EventItem(event: currentWot),
                              ),
                              );
                              
                            },
                          )
                        : new Text(""),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
