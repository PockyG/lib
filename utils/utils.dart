import 'package:wotsay/models/wot.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

List<Wot> convertJsonToWotList(jsonEnvelope){
  List<Wot> wotList = new List<Wot>();
  print(jsonEnvelope["envelope"]["instance"]["itinerary"].length);
  var count = jsonEnvelope["envelope"]["instance"]["itinerary"].length;
  for(int i = 0; i < count; i++){
    wotList.add(Wot.fromJson(jsonEnvelope["envelope"]["instance"]["itinerary"][i]));
  }
  return wotList;
}


Future<http.Response> createPost(Post post, String url) async{
   final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: post.postToJson()
  );
  return response;
}



class Post{
  String username;
  String password;

  Map<String, String> postToJson(){
    return {
      "username": username,
      "password": password,
    };
  }
}