import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/services/weather_services.dart';
import 'package:weatherapp/models/weather_model.dart';
class Search extends StatelessWidget {

 String? cityname;
 Search({this.updateUi});
 VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.orange,
        title: Text('Search a City'),

      ),
body: Center(

  child:   Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: TextField(
      onChanged: (data){
    cityname=data;

      },
      onSubmitted: (data)async{
cityname=data;
weatherservices services=weatherservices();
 WeatherModel? weather=await services.getWeather(cityname: cityname!);
Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
Provider.of<WeatherProvider>(context,listen: false).cityName=cityname;


//updateUi!();
Navigator.pop(context);

      },
      decoration:InputDecoration(

        contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 16),
        label: Text('Search'),
    //    prefixIcon:Icon(Icons.search) , put an icon at the begining
        suffixIcon: GestureDetector(
            child: Icon(Icons.search),
        onTap: ()async{
          weatherservices services=weatherservices();
          WeatherModel? weather=await services.getWeather(cityname: cityname!);
          Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
          Provider.of<WeatherProvider>(context,listen: false).cityName=cityname;


//updateUi!();
          Navigator.pop(context);


      },
        ),
        border: OutlineInputBorder(),
        hintText: 'Enter a city'

      ) ,

          //controller:



        ),
  ),
),

    );
  }
}
