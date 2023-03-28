import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import 'color.dart';
import 'my_screen_widget.dart';

class Screen3 extends StatefulWidget {
  final Weather weather;
  final bool isDarkTheme;
  const Screen3({Key? key, required this.weather, required this.isDarkTheme}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
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
              child: Text(
                'Screen 3',
                style: TextStyle(
                  fontSize: 24.0,
                  color: widget.isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
            )
          ),
        ),
      ],
    );
  }
}
