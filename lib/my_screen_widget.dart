import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_background_weather/item_widget.dart';
import 'package:weather/weather.dart';

class MyScreenWidget extends StatefulWidget {
  final String? locationName;
  final Weather? weather;
  final bool? isDarkTheme;
  const MyScreenWidget({Key? key, this.locationName, required this.weather, this.isDarkTheme,}) : super(key: key);

  @override
  State<MyScreenWidget> createState() => _MyScreenWidgetState();
}

class _MyScreenWidgetState extends State<MyScreenWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.locationName ?? 'Current Location',
              style: TextStyle(
                fontSize: 22.0,
                color: widget.isDarkTheme == true ? Colors.white : Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                '${widget.weather?.temperature?.celsius?.roundToDouble() ?? 0}˚C',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w700,
                  color: widget.isDarkTheme == true ? Colors.white : Colors.black,
                ),
              ),
            ),
            Text(
              widget.weather?.weatherDescription ?? '',
              style: TextStyle(
                fontSize: 20.0,
                color: widget.isDarkTheme == true ? Colors.white : Colors.black,
              ),
            ),
            widget.weather != null
                ? Image.network(
              'https://openweathermap.org/img/wn/${widget.weather!.weatherIcon}@2x.png', width: 80.0, height: 80.0,
            )
                : Container(),
            widget.weather != null
            ? _getItem()
            : Container(),
          ],
        ),
      ),
    );
  }

  _getItem(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ItemWidget(
              itemName: 'Wind',
              itemData: widget.weather?.windSpeed.toString() ?? '',
              itemSubData: widget.weather?.windDegree.toString() ?? '',
            ),
            ItemWidget(
                itemName: 'Sunrise',
                itemData: widget.weather != null
                  ? DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(widget.weather!.sunrise!.millisecondsSinceEpoch)).toString()
                  : '',
                itemSubData: widget.weather != null
                    ? DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(widget.weather!.sunset!.millisecondsSinceEpoch)).toString()
                    : '',
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ItemWidget(
              itemName: 'Temperature',
              itemData: widget.weather?.temperature?.celsius?.roundToDouble().toString() ?? '',
              itemSubData: widget.weather?.tempFeelsLike?.celsius?.roundToDouble().toString() ?? '',
          ),
        )
      ],
    );
  }
}
