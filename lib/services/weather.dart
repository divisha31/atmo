import 'package:atmo/services/networking.dart' ;
import 'package:atmo/services/location.dart';

const apikey = '181319eca86e6f2deb1d753dba2ad72a';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {


 Future<dynamic> getCityWeather(String cityName) async {

   NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?q=$cityName&appid=$apikey&units=metric');
  var weatherData  = await networkHelper.getData();
  return weatherData;   

  }

 Future<dynamic> getLocationWeather() async {
   Location location = Location();
   await location.getCurrentLocation(); //but we can only await on method which return future so returning future in location.dart
   print(location.latitude);
   print(location.longitude);
  

  NetworkHelper networkHelper =  NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
 
  var weatherData  = await networkHelper.getData();
  return weatherData;

 }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '☼';
    } else if (condition < 400) {
      return '☁️';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '☙';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Have a walk to enjoy Nature ☘';
    } else if (temp > 20) {
      return 'Best time for ✈';
    } else if (temp < 10) {
      return 'Have some ☕ ';
    } else {
      return 'Time for some good ☊';
    }
  }
}
