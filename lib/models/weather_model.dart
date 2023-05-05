import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherStateName;

  WeatherModel(
      {required this.date, required this.temp, required this.maxtemp, required this.mintemp, required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data){
    var jsonData = data['forecast']['forecastday'][0]['day'];


    return WeatherModel(
        date:DateTime.parse(data['location']['localtime']) ,//data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxtemp: jsonData['maxtemp_c'],
        mintemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }

  @override
  String toString() {
    return 'temp=$temp mintemp=$mintemp date=$date';
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' || weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else
    if (weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else
    if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' || weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else
    if (weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    } else
    if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return Colors.red;
    } else {
      return Colors.cyan;
    }
  }
}