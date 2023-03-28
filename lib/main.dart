import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_background_weather/my_screen_widget.dart';
import 'package:test_background_weather/screen_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Screen1(),
    );
  }
}
