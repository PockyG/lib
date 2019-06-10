import 'dart:io';

import 'package:flutter/material.dart';
import '../../utils//testdata.dart' as testdata;
import '../../utils/utils.dart' as utils;
import '../../utils/api/apiUtils.dart' as utilsAPI;
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


  _apiButtonPressed()async {
     var testUser = new utils.Post(username: "Lionel", password: "expecting a 401");

var mapBody = {"HEY YEALLLLALL":"-27,153","dist":"50","itineraryID":"2019052216402185876530800"};
  String stringBody = mapBody.toString();
  String postResult = "rip";
    postResult = await utils.postDigestAuth("http://206.196.111.123:8111/LATEST/resources/helloworld", "api", "@pi201906", 
     stringBody);
     print("THe BUTTON RESULTS:  " + postResult);
     
     



    

 


  }

  _getButtonPressed(){
    // utils.testGet(utilsAPI.realUrl).then(
    //    (response) {print("response:" + response.body); print("headers:" + response.headers.toString());}).catchError((onError)=> print(onError));
    // utils.getHttpClient("api", "@pi201906").get("http://206.196.111.123:8111/LATEST/resources/WotSayIT?rs:latlong=-27,153&rs:dist=50")
    
    //utils.getHttpClient("api", "@pi201906").getUrl('http://colormind.io/list/').then((onValue){print(onValue.toString());});
    utils.getColors("api", "@pi201906");
    
  }

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
                  _apiButtonPressed();
                });
              },
              child: Text("post?"),
            ),
            new RaisedButton(
              child:  Text("get?"),
              onPressed: (){
                _getButtonPressed();
              },
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
