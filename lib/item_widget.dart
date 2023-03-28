import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  final String itemName;
  final String itemData;
  final String itemSubData;
  const ItemWidget({Key? key, required this.itemName, required this.itemData, required this.itemSubData}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  getIconItem(),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      widget.itemName,
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: getDataItem(),
              )
            ],
          ),
          getSubDataItem(),
        ],
      )
    );
  }

  getIconItem(){
    switch(widget.itemName){
      case 'Wind':
        return const Icon(Icons.wind_power_rounded, size: 20.0, color: Colors.white);
      case 'Sunrise':
        return const Icon(Icons.sunny, size: 20.0, color: Colors.white);
      case 'Temperature':
        return const Icon(Icons.thermostat, size: 20.0, color: Colors.white);
    }
  }

  getDataItem(){
    switch(widget.itemName){
      case 'Wind':
        return Text(
          '${widget.itemData} m/s',
          style: const TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w700,
              color: Colors.white
          ),
        );
      case 'Sunrise':
        return Text(
          widget.itemData,
          style: const TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w700,
              color: Colors.white
          ),
        );
      case 'Temperature':
        return Text(
          '${widget.itemData}˚C',
          style: const TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w700,
              color: Colors.white
          ),
        );
    }
  }

  getSubDataItem(){
    switch(widget.itemName){
      case 'Wind':
        return Text(
          'Wind Deg: ${widget.itemSubData}˚',
          style: const TextStyle(
              fontSize: 19.0,
              color: Colors.white
          ),
        );
      case 'Sunrise':
        return Text(
          'Sunset will be at: ${widget.itemSubData}',
          style: const TextStyle(
              fontSize: 19.0,
              color: Colors.white
          ),
        );
      case 'Temperature':
        return Text(
          'Feels like: ${widget.itemSubData}˚C',
          style: const TextStyle(
              fontSize: 19.0,
              color: Colors.white
          ),
        );
    }
  }
}
