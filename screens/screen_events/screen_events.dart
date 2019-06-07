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
          title: Text(this.widget.location),
          actions: <Widget>[
            new RaisedButton(
              onPressed: () {
                setState(() {
                  wotList = utils.convertJsonToWotList(data);
                });
              },
              child: Text("test"),
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
                    child: wotList.length > 0 ? new ListView.builder(
                    itemCount: wotList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return new Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: EventItem(event: wotList[index]),
                      );
                      
                    },
                  ): new Text(""),
                  ),
                  
                  
                ),
              ],
            ),
          ],
        ));
  }
}
