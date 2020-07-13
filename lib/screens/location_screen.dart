import 'package:flutter/material.dart';
import 'package:atmo/utilities/constants.dart';
import 'package:atmo/services/weather.dart';
import 'package:atmo/screens/city_screen.dart' ;



class LocationScreen extends StatefulWidget {
  @override
   LocationScreen(this.locationWeather);

   final locationWeather;
  _LocationScreenState createState() => _LocationScreenState();
}

//For layout purpose we must need either Statelessclass or State class so We are extending State class here 
//And State class must need parameter as a statefull class or class that inherited Statefull class 
//Thats Why we have given here LocationScreen as a paramtere....

class _LocationScreenState extends State<LocationScreen> {

  String city;
  int temperature;
  int condition;
  String conditionIcon;
  String conditionMsg;
   WeatherModel weather = WeatherModel();
  @override
 void initState(){
   super.initState();
    updateUI(widget.locationWeather);
    // widget is a instance of statefulWidget and we are extending StatefulWidget 
    //in LocationScreen we can access its properties like locationWeather
 //How we get this Widget in LocationScreenState? -- its because we extend State class -- widget is a configuiration of State clas
  }


  void updateUI(dynamic weatherData)
  {
    setState(() {
      if(weatherData == null){
        temperature = 0;
        conditionIcon ='Error';
        conditionMsg = 'Unable to Fetch location';
        city = '';
        return;
      }
      
    city = weatherData ['name'];
   // double temp = weatherData ['main']['temp'];
    //print(temp);
    //temperature = temp.toInt();
    temperature =  weatherData ['main']['temp'].toInt();
    print(temperature);
    int condition = weatherData ['weather'][0]['id'];
    conditionIcon = weather.getWeatherIcon(condition);
    conditionMsg = weather.getMessage(temperature);

     });

  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: ()  async {
                       var weatherData = await weather.getLocationWeather();
                       print('$weatherData');
                       updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                     var  typedName = await  Navigator.push(
                         context,
                    MaterialPageRoute(
                      builder: (context) => CityScreen()
                                 ),
                              );
                           print(typedName);  
                          if(typedName != null)
                          {
                          var weatherData = await weather.getCityWeather(typedName);
                          print(weatherData);
                          updateUI(weatherData);
                          } 
                           },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°C',
                     style: kTempTextStyle,
                     ),
                    Text(
                      '$conditionIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$conditionMsg in  $city !",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*String city = decodedData ['name'];
   double temp = decodedData ['main']['temp'];
   int condition = decodedData ['weather'][0]['id'];
   print(city);
   print(temp);
   print(condition); */