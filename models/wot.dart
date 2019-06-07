

class Wot {

  String wotId;
  String wotName;
  String wotDescription;
  List<WotAddress> wotAddress;
  double wotDistanceToLocation;
  String wotImageUrl;

  Wot({
    this.wotId,
    this.wotName,
    this.wotDescription,
    this.wotAddress,
    this.wotDistanceToLocation,
    this.wotImageUrl,


});


factory Wot.fromJson(Map<String, dynamic> parsedJson){
    
 var list = parsedJson['addresses'] as List;
    print(list.runtimeType); //returns List<dynamic>
List<WotAddress> addressList = list.map((i) => WotAddress.fromJson(i)).toList();
    
    return Wot(
      wotId: parsedJson['productId'],
      wotName : parsedJson['productName'],
      wotDescription : parsedJson ['productDescription'],
      wotAddress: addressList,
      wotDistanceToLocation: parsedJson['distanceToLocation'],
      wotImageUrl: parsedJson['productImage'],
    );
  }
}

class WotAddress{
  String addressLine1;
  String addressLine2;
  String addressLine3;
  String addressCity;
  String addressState;
  String addressPostCode;
  String addressCountry;

  WotAddress({
     this.addressLine1,
  this.addressLine2,
  this.addressLine3,
  this.addressCity,
  this.addressState,
  this.addressPostCode,
  this.addressCountry,
  });

  factory WotAddress.fromJson(Map<String, dynamic> parsedJson){
    return WotAddress(
      addressLine1: parsedJson['address_line'],
      addressLine2: parsedJson['address_line2'],
      addressLine3: parsedJson['address_line3'],
      addressCity: parsedJson['city'],
      addressState: parsedJson['state'],
      addressPostCode: parsedJson['postcode'],
      addressCountry: parsedJson['country'],
    );

   
  }



}