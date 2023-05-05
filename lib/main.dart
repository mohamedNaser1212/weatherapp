import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/home_page.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/services/weather_services.dart';
void main() {
  runApp( ChangeNotifierProvider(
      create:(context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherModel? weather;
   WeatherApp({ Key? key }) : super(key: key);

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       primarySwatch: Provider.of<WeatherProvider>(context).weatherData==null ?Colors.blue:Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),
       //brightness: Brightness.dark

      ),
      home: HomePage(),
    );
  }
}