import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/search_page.dart';

class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
void updateUi()
{
  setState(() {

  });

}
WeatherModel? weatherData;


  @override
  Widget build(BuildContext context) {
    weatherData=Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)
            {
              return Search(
                updateUi: updateUi,

              );

            }));

          },
              icon: const Icon(Icons.search))

        ],
        title: const Text('Weather App'),
      ),
      body:weatherData ==null? Center(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const[
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ):Container(
        decoration: BoxDecoration(
gradient: LinearGradient(
  colors: [
   weatherData!.getThemeColor(),
   weatherData!.getThemeColor()[500]!,
   weatherData!.getThemeColor()[300]!,
  // Colors.orange[50]!,
   //weatherData!.getThemeColor()[50]!,

  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
),

        ),



        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
           const Spacer(
              flex: 3,
            ),
            Text(
            Provider.of<WeatherProvider>(context).cityName!
            ,style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold

            ),),
            Text(
              'Updated at: ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}'
              ,style: const TextStyle(
                fontSize: 20,

            ),),
            const Spacer(),

            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()),//'assets/images/clear.png'
              Text(
                weatherData!.temp.toInt().toString()
                ,style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold

              ),),
              Column(
                children: [
                  Text('maxTemp:${weatherData!.maxtemp.toInt()}'),
                  Text('minTemp:${weatherData!.mintemp.toInt()}'),



                ],

              ),
            ],



          ),
            const Spacer(),

            Text(
            weatherData?.weatherStateName ??'' //if it is null print an empty String
            ,style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,

            ),),
             const Spacer(
              flex: 5,
            ),
          ],


        ),


      ),
    );
  }
}
