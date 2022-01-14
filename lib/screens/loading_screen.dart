import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  static const apiKey = 'c88fa1c4f8d412f8e8d9d1e1d6132902';
  Location location = Location();
  double? lat, lon;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Get Location'),
          onPressed: () {
            getData();
          },
        ),
      ),
    );
  }

  void getData() async {
    //get user position
    Position position = await Location().determinePosition();

    //get weather info based on user location
    String weatherData =
        await Network().getWeatherData(position.latitude, position.longitude);

    print(weatherData);
  }
}
