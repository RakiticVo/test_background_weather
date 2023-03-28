import 'package:flutter/material.dart';
import 'package:test_background_weather/screen_3.dart';
import 'package:weather/weather.dart';

import 'color.dart';

class Screen2 extends StatefulWidget {
  final Weather weather;
  final bool isDarkTheme;
  const Screen2({Key? key, required this.weather, required this.isDarkTheme}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: AppColor().getThemeByWeather(widget.weather),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Screen 2',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: widget.isDarkTheme ? Colors.white : Colors.black,
                    ),
                  ),
                  MaterialButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Screen3(weather: widget.weather, isDarkTheme: widget.isDarkTheme),));
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
                ],
              ),
            )
          ),
        ),
      ],
    );
  }
}
