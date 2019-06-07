import 'package:flutter/material.dart';
import 'package:wotsay/models/wot.dart';

List<Wot> convertJsonToWotList(jsonEnvelope){
  List<Wot> wotList = new List<Wot>();
  print(jsonEnvelope["envelope"]["instance"]["itinerary"].length);
  var count = jsonEnvelope["envelope"]["instance"]["itinerary"].length;
  for(int i = 0; i < count; i++){
    wotList.add(Wot.fromJson(jsonEnvelope["envelope"]["instance"]["itinerary"][i]));
  }
  return wotList;
}


