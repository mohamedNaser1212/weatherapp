import 'dart:convert';
import 'package:weatherapp/models/weather_model.dart';
import 'package:http/http.dart' as http;

class weatherservices{
String baseUrl='http://api.weatherapi.com/v1';
String apikey='06e5c732522c46b188d115855231902';
  Future<WeatherModel?> getWeather({required String cityname})async
  {
    WeatherModel? weather;
   try{
     Uri url=Uri.parse('$baseUrl/forecast.json?key=$apikey&q=$cityname&days=7');

     http.Response response=await http.get(url);
     Map<String,dynamic> data=jsonDecode(response.body);
     //MAP <KEY,VALUE>



  weather= WeatherModel.fromJson(data);


   }catch(e){
     print(e);
   }
return weather;

  }

}
