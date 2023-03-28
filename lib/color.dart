import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class AppColor {

  LinearGradient getThemeByWeather(Weather weather){
    switch(weather.weatherDescription){
      case 'clear sky':
        return AppColor().sunny;
      case 'few clouds':
        return AppColor().sunny;
      case 'scattered clouds':
        return AppColor().cloud;
      case 'broken clouds':
        return AppColor().cloud;
      case 'overcast clouds':
        return AppColor().cloud;
      case 'shower rain':
        return AppColor().heavyRain;
      case 'moderate rain':
        return AppColor().heavyRain;
      case 'rain':
        return AppColor().rain;
      case 'light rain':
        return AppColor().rain;
      case 'thunderstorm':
        return AppColor().heavyRain;
      case 'snow':
        return AppColor().snow;
      case 'light snow':
        return AppColor().snow;
      case 'mist':
        return AppColor().cloud;
      case 'haze':
        return AppColor().cloud;
      default:
        return AppColor().defaultTheme;
    }
  }

  LinearGradient get sunny => const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xff966cc3), Color(0xffcba1ab), Color(0xfffecc93)],
  );

  LinearGradient get heavyRain => const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xff011439), Color(0xff012c57), Color(0xff046198)],
  );

  LinearGradient get snow => const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xffffcfcf), Color(0xffa3d0dc), Color(0xff60cee4)],
  );

  LinearGradient get rain => const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xff61b1ea), Color(0xff9fdcf7), Color(0xffb7fcff)],
  );

  LinearGradient get cloud => const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xff777676), Color(0xffd1d1d1), Color(0xffffffff)],
  );

  LinearGradient get defaultTheme => const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xffffffff), Color(0xffffffff)],
  );
}