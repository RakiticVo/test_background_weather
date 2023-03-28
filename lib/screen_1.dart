import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_background_weather/color.dart';
import 'package:test_background_weather/my_screen_widget.dart';
import 'package:test_background_weather/screen_2.dart';
import 'package:weather/weather.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final WeatherFactory wf = WeatherFactory('503610f098f2654beba72124a8bada6e', language: Language.ENGLISH);
  Weather? weather;
  Position? currentPosition;

  List<String> cities = ['Brisbane', 'Toronto', 'Toulouse', 'Swansea', 'Hanoi', 'Osaka', 'Vik', 'Boston'];
  int count = -1;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: weather != null ? AppColor().getThemeByWeather(weather!) : AppColor().defaultTheme,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: currentPosition != null && weather != null
            ? Column(
              children: [
                MyScreenWidget(weather: weather, isDarkTheme: _isDarkTheme(), locationName: count >= 0 ? cities[count] : null),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      MaterialButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2(weather: weather!, isDarkTheme: _isDarkTheme()),));
                        },
                        color: Colors.black,
                        child: Text(
                          'Next screen',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          count = Random().nextInt(cities.length);
                          weather = await wf.currentWeatherByCityName(cities[count]);
                          setState(() {
                            print(weather);
                          });
                        },
                        color: Colors.black,
                        child: Text(
                          'Random City Weather',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
            : Container(),
          ),
        ),
      ],
    );
  }

  void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    currentPosition = await Geolocator.getCurrentPosition();
    setState(() {
      _getWeather();
    });
  }

  void _getWeather() async {
    if(currentPosition != null){
      weather = await wf.currentWeatherByLocation(currentPosition!.latitude, currentPosition!.longitude);
      setState(() {
        print(weather);
      });
    }
  }

  _isDarkTheme(){
    if(weather!.weatherDescription == 'few clouds'
        || weather!.weatherDescription == 'scattered clouds'
        || weather!.weatherDescription == 'broken clouds'
        || weather!.weatherDescription == 'overcast clouds'
        || weather!.weatherDescription == 'mist'
    ) {
      return false;
    }else{
      return true;
    }
  }
}
