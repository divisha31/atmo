import 'package:atmo/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:atmo/screens/location_screen.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  WeatherModel weatherModel = WeatherModel();

 //double latitude;
 //double longitude;
  @override // initState is not  MUST override mwthod but to call getLocationData from it we must need to over Write it ..
  void initState(){
    super.initState();
    getLocationData();
    
  }

  void getLocationData() async{

    var weatherData = await weatherModel.getLocationWeather();
  
    Navigator.push(context, MaterialPageRoute(builder:(context)
    {
      return LocationScreen(weatherData);
     }));
    }

 @override //build method is a MUST override method -its compulsary to override it 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
       body: Center(
         
        child: SpinKitRotatingPlain(
         color:Colors.white,
        
         size:100.0, 
        
        ),
      ), 
    );
  }
 }
