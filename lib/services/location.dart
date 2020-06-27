import 'package:geolocator/geolocator.dart';

class Location{
  double latitude;
  double longitude;

 Future<void> getCurrentLocation() async {
    try {
    
  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  latitude = position.latitude;
  longitude = position.longitude;
  //When we use await here it means it si waiting for geoloacator to finish it's task and assign its value to position 
  //Future<position> postion = Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  //When using future is similar to like geeting the receipt of your order and waiting for your coffe to get ready so it will calculate value in future..
  }
   catch(exception)
  {
   print(exception);
  } 
  }
}