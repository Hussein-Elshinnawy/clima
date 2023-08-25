import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';


const apiKey='dc778fa822ed5cc51bef46f5db4a1998';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? longitdue;
  double? latitude;
  void getLocationData() async {
    Uri url= Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitdue&appid=$apiKey');
    Location location= Location();
    await location.getCurrentLocation();
    longitdue=location.longitude;
    latitude=location.latitude;
    NetworkHelper networkHelper=NetworkHelper(url);
    var weatherData= networkHelper.getData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
