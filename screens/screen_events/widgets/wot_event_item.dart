import 'package:flutter/material.dart';
import '../../../models/wot.dart';

class EventItem extends StatefulWidget {
  final Wot event;

  @override
  _EventItemState createState() => _EventItemState();

  EventItem({this.event});
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    Wot event = this.widget.event;
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(16.0),
          //clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: <Widget>[
              Image.network(
                event.wotImageUrl,
                fit: BoxFit.fill,
                scale: 0.8,
              ),
              ListTile(
                contentPadding: EdgeInsets.all(8.0),
                title: new Text(
                  event.wotName,
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                subtitle: new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // new Text(event.wotAddress[0].addressCity.toString()),
                      // new Text(event.wotDescription.split(".")[0] + "."),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //borderOnForeground: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        new Text(event.wotDistanceToLocation.toString()),
      ],
    );

    ;
  }
}
