import 'dart:convert';

import 'package:wotsay/models/wot.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:wotsay/utils/api/apiUtils.dart' as utilsApi;
import 'package:crypto/crypto.dart' as crypto;


List<Wot> convertJsonToWotList(jsonEnvelope) {
  List<Wot> wotList = new List<Wot>();
  print(jsonEnvelope["envelope"]["instance"]["itinerary"].length);
  var count = jsonEnvelope["envelope"]["instance"]["itinerary"].length;
  for (int i = 0; i < count; i++) {
    wotList.add(
        Wot.fromJson(jsonEnvelope["envelope"]["instance"]["itinerary"][i]));
  }

  
  return wotList;
}

class Post {
  String username;
  String password;

  Post({this.username, this.password});
//{"user":{},"params":{"latlong":"-27,153","dist":"50","itineraryID":"2019052216402185876530800"}
  Map<String, String> postToJson() {
    return {
      "username": username,
      "password": password,

      // "user": {},
      // "params":{"latlong":"-27,153","dist":"50","itineraryID":"2019052216402185876530800"},
    };
  }
}

//for login?
Future<http.Response> createPost(Post post, String url) async {
  final response = await http.post(
    '$url',
    headers: {
      "User-Agent": "PostmanRuntime/7.13.0",
      "Accept": "*/*",
      "Cache-Control": "no-cache",
      "Postman-Token":
          "7d70fdbd-c626-467b-9424-0e9cc1402151,802172cc-42ea-4b32-ad1f-1e1b1b29e0c2",
      "Host": "206.196.111.123:8111",
      "accept-encoding": "gzip, deflate",
      "Connection": "keep-alive",
      "Authorization":
          "Digest username=\"api\", realm=\"public\", nonce=\"376c0c9843d42c:i61eT3rbXt2XVmT87lyMbQ==\", uri=\"/LATEST/resources/helloworld\", algorithm=\"MD5\", qop=auth, nc=00000001, cnonce=\"vYsU6qxC\", response=\"086c3153b4d96000def35ad5a25b1e16\", opaque=\"d3d2dc4f0ef81cc4\"",
    },
    body: post.postToJson(),
  );
  //jsonDecode(response.body);
  return response;
}

//   headers=  {
// "User-Agent": "PostmanRuntime/7.13.0",
// "Accept": "*/*",
// "Cache-Control": "no-cache",
// "Postman-Token": "7d70fdbd-c626-467b-9424-0e9cc1402151,802172cc-42ea-4b32-ad1f-1e1b1b29e0c2",
// "Host": "206.196.111.123:8111",
// "accept-encoding": "gzip, deflate",
// "Connection": "keep-alive",
// "Authorization": "Digest username=\"api\", realm=\"public\", nonce=\"376c0c9843d42c:i61eT3rbXt2XVmT87lyMbQ==\", uri=\"/LATEST/resources/helloworld\", algorithm=\"MD5\", qop=auth, nc=00000001, cnonce=\"vYsU6qxC\", response=\"086c3153b4d96000def35ad5a25b1e16\", opaque=\"d3d2dc4f0ef81cc4\"",

//   },

Future<http.Response> testPost(String url) async {
  HttpClientDigestCredentials creds =
      new HttpClientDigestCredentials("api", "@pi2019");

  ///HttpClient authenticatingClient = HttpClient();
  //authenticatingClient.addCredentials(, utilsApi.realUrl, "public", creds);

  final response = await http.post(
    '$url',
    headers: {
      "User-Agent": "PostmanRuntime/7.13.0",
      "Accept": "*/*",
      "Cache-Control": "no-cache",
      "Postman-Token":
          "7d70fdbd-c626-467b-9424-0e9cc1402151,802172cc-42ea-4b32-ad1f-1e1b1b29e0c2",
      "Host": "206.196.111.123:8111",
      "accept-encoding": "gzip, deflate",
      "Connection": "keep-alive",
      "Authorization":
          "Digest username=api, realm=public, nonce=376c0c9843d42c:i61eT3rbXt2XVmT87lyMbQ==, uri=/LATEST/resources/helloworld, algorithm=MD5, qop=auth, nc=00000001, cnonce=vYsU6qxC, response=086c3153b4d96000def35ad5a25b1e16, opaque=d3d2dc4f0ef81cc4",
      HttpHeaders.authorizationHeader: "yea,",
    },
    body: {},
  );
  //jsonDecode(response.body);
  return response;
}

Future<http.Response> testGet(String url) async {
  HttpClientDigestCredentials creds =
      new HttpClientDigestCredentials("api", "@pi2019");

  ///HttpClient authenticatingClient = HttpClient();
  //authenticatingClient.addCredentials(, utilsApi.realUrl, "public", creds);

  var response = await http.get(url, headers: {
    "User-Agent": "PostmanRuntime/7.13.0",
    "Accept": "*/*",
    "Cache-Control": "no-cache",
    "Postman-Token":
        "d84ca043-999a-49c0-9c51-52c07101e2ca,4e26d3b9-f949-43fb-86ca-8cca74b218d9",
    "Host": "localhost:8111",
    "accept-encoding": "gzip, deflate",
    "Connection": "keep-alive",
    "Authorization":
        "Digest username=\"admin\", realm=\"public\", nonce=\"375b863bb6d1fa:bkYwI54StGIJDyyTf4FJYg==\", uri=\"/LATEST/resources/ATDW?rs:latlong=-27,153&rs:dist=50\", algorithm=\"MD5\", qop=auth, nc=00000001, cnonce=\"Xvb8rbFM\", response=\"7c0964344e249b2ba5d4e8e7820aeaa4\", opaque=\"3b31ee115e8cd68f\"",
    "cache-control": "no-cache"
  });

  print("STROPSNOPS: " + response.body.toString());

  print("WWW-AUTHENTICATE: " + response.headers["www-authenticate"].toString());
  print("NONCE: " +
      response.headers["www-authenticate"]
          .toString()
          .split("nonce=\"")[1]
          .split(",\"")[0]
          .split("\",")[0]);
  String nonce = response.headers["www-authenticate"]
      .toString()
      .split("nonce=\"")[1]
      .split(",\"")[0]
      .split("\",")[0]
      .toString();
  print("NONCE: " + nonce);

// var huh = await http.get(url, headers: {
//       "User-Agent": "PostmanRuntime/7.13.0",
//       "Accept": "*/*",
//       "Cache-Control": "no-cache",
//       "Postman-Token":
//           "d84ca043-999a-49c0-9c51-52c07101e2ca,4e26d3b9-f949-43fb-86ca-8cca74b218d9",
//       "Host": "localhost:8111",
//       "accept-encoding": "gzip, deflate",
//       "Connection": "keep-alive",
//       "Authorization":
//           "Digest username=\"admin\", realm=\"public\", nonce=\"$nonce\", uri=\"/LATEST/resources/ATDW?rs:latlong=-27,153&rs:dist=50\", algorithm=\"MD5\", qop=auth, nc=00000001, cnonce=\"Xvb8rbFM\", response=\"7c0964344e249b2ba5d4e8e7820aeaa4\", opaque=\"3b31ee115e8cd68f\"",
//       "cache-control": "no-cache"
//     });

//     print("HUH:  "  + huh.body.toString());

//   //  final response = await http.get('$url').then((response){
//   //    print(response.body);
//   //    print("GET:");
//   //    print("HEADERS: " + response.headers.toString());
//   //    //Map<String, String> huh = response.headers['www-authenticate'];
//   //    response.headers['www-authenticate'];

//   //    return {};
//   //    }).then((onValue){
//   //      print("THE VALUE AFFTER: "  + onValue["l"].toString());
//   //    }
//   //    );

//   //jsonDecode(response.body);

  return response;
}

HttpClient getHttpClient(String userName, String password) {
  HttpClient client = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
  client.authenticate = (uri, scheme, realm) {
    client.addCredentials(
        uri, realm, new HttpClientDigestCredentials(userName, password));
    return new Future.value(true);
  };
}



//This returns a statcode 200. it authenticates but thats it.
getDigestAuth(String userName, String password) async{
  HttpClient client = new HttpClient();
  var mapBody = {"latlong":"-27,153","dist":"50","itineraryID":"2019052216402185876530800"};
  String stringBody = mapBody.toString();

client.authenticate = (uri, scheme, realm){

};

      client.addCredentials(
        Uri.parse("http://206.196.111.123:8111/LATEST/resources/helloworld"), "public", new HttpClientDigestCredentials(userName, password));

  await client
      .postUrl(
          Uri.parse('http://206.196.111.123:8111/LATEST/resources/helloworld'))
      .then((HttpClientRequest request) {
    print("requteste");
    print("request headers? :" + request.headers.toString());
    print("remetoh: " + request.method);
    print("uri:" + request.uri.toString());
    request.headers.add("Authorization", "Digest username=\"admin\", realm=\"public\", nonce=\"375b863bb6d1fa:bkYwI54StGIJDyyTf4FJYg==\", uri=\"/LATEST/resources/ATDW?rs:latlong=-27,153&rs:dist=50\", algorithm=\"MD5\", qop=auth, nc=00000001, cnonce=\"Xvb8rbFM\", response=\"7c0964344e249b2ba5d4e8e7820aeaa4\", opaque=\"3b31ee115e8cd68f\"",);
    request.headers.contentLength = "helloworld".length;
    request.write("helloworld");
    return request.close();
  }).then((response) {
    print("response");
    print("STAT CODE:" + response.statusCode.toString());
    print("huh:" + response.toString());

    print(response.headers.toString());
    response.transform(utf8.decoder).listen((contents) {
      // handle data
      print("RESPONSE CONTENT: " + contents.toString());
    });
  }); 
}


//Use this to post data.
//TODO: Need to append the url later. using a fixed url in this function at the moment.
//not sure why it needs to be "/LATEST/resources/helloworld" and not the full url.
Future<String> postDigestAuth(String url, String userName, String password, String body)async{
  HttpClient client = new HttpClient();

  String resultData = "initNull";

  String nonceVal;
  String realmVal;
  //Make a request and get the 401 authentication failed header information
  //Specifically the nonce, and realm.

  await http.get(url).then(
  (response)async{
    print("THE GET RESPONSE HEADERS: " + response.headers.toString());
    print("THE GET RESPONSE BODY: " +response.body);
        print("NONCE: " +
        response.headers["www-authenticate"]
            .toString()
            .split("nonce=\"")[1]
            .split(",\"")[0]
            .split("\",")[0]);
    nonceVal =  response.headers["www-authenticate"]
            .toString()
            .split("nonce=\"")[1]
            .split(",\"")[0]
            .split("\",")[0];
    print(nonceVal);

    realmVal = response.headers["www-authenticate"]
            .toString()
            .split("realm=\"")[1]
            .split(",\"")[0]
            .split("\",")[0].split("\"")[0];
            print(realmVal);
  // //generate a client nonce.(anything apparently.)
String exampleCnonce = "SpL0Prz6";

//We need to encode our response value to pass in the auth header using the same encryption (md5).
//This is the standard.
  String ha1 = getHA1(userName,realmVal, password);
String ha2 = getHA2("POST", "/LATEST/resources/helloworld");
String responseVal = getResponse(ha1, ha2, nonceVal, "00000001", exampleCnonce);


//Send an actual post request with the nonce and realm and calculated response in the auth header.
 await client
      .postUrl(
          Uri.parse(url))
      .then((HttpClientRequest request) async{
        print("REQUESTEISTN");

request.headers.contentLength = body.length;
request.headers.contentType = ContentType.text;
request.headers.add("Authorization", 'Digest username="$userName", realm="$realmVal", nonce="$nonceVal", uri="/LATEST/resources/helloworld", algorithm="MD5", qop=auth, nc=00000001, cnonce="$exampleCnonce", response="$responseVal"');
request.write(body);
    await request.close().then((response)async{
      print("response");
    print("STAT CODE:" + response.statusCode.toString());
    print("huh:" + response.toString());

    print(response.headers.toString());
    response.transform(utf8.decoder).listen((contents) {
      // handle data
      print("RESPONSE CONTENT WHATTTT: " + contents.toString());
      resultData = contents.toString();
      
    });
    }).then((nullVal){print("endresponse");}
      
    );
      }).then((nullVal){print("endrequest");});
  }).whenComplete((){
    print("DONE");
   // resultData = "NOT WOW";
    return resultData;
  });

return resultData;

}

//MD5 HELPERS-------------------------
 String getHA1(String username, String realm, String password) {
  List<int> toConvert = [];
  toConvert.addAll(utf8.encode(username));
  toConvert.add(58);
  toConvert.addAll(realm.codeUnits);
  toConvert.add(58);
  toConvert.addAll(utf8.encode(password));
  return crypto.md5.convert(toConvert).toString();
}

String getHA2(String method, String url) {
  List<int> toConvert = [];
  toConvert.addAll(utf8.encode(method));
  toConvert.add(58);
  toConvert.addAll(utf8.encode(url));
  return crypto.md5.convert(toConvert).toString();
}

String getResponse(String ha1, String ha2, String nonce, String nonceCount, String cnonce) {
  List<int> toConvert = [];
  toConvert.addAll(utf8.encode(ha1));
  toConvert.add(58);
  toConvert.addAll(utf8.encode(nonce));
  toConvert.add(58);
  toConvert.addAll(utf8.encode(nonceCount));
  toConvert.add(58);
  toConvert.addAll(utf8.encode(cnonce));
  toConvert.add(58);
  toConvert.addAll(utf8.encode("auth"));
  toConvert.add(58);
  toConvert.addAll(utf8.encode(ha2));
  return crypto.md5.convert(toConvert).toString();
}
//MD5 HELPERS END---------------------------


