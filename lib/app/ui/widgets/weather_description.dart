import 'package:climate/app/services/weather.dart';
import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';

class WeatherDescription extends StatefulWidget {
  final dynamic weatherData;

  WeatherDescription({required this.weatherData});

  @override
  State<WeatherDescription> createState() => _WeatherDescriptionState();
}

class _WeatherDescriptionState extends State<WeatherDescription> {
  final WeatherModel weatherModel = WeatherModel();
  String descriptionText = '';
  @override
  Widget build(BuildContext context) {
    dynamic weatherData = widget.weatherData;
    return Container(
      padding: weatherData == null
          ? EdgeInsets.all(20)
          : EdgeInsets.fromLTRB(20, 10, 20, 10),
      height: 200,
      width: double.infinity,
      child: Center(
        child: Text(
          weatherModel.getMessage(weatherData['main']['temp'].toInt()),
          style: TextStyle(fontSize: 36),
        ),
      ),
      decoration: BoxDecoration(
          color: KThemeColors.bg_lightBlue,
          borderRadius: KThemeBorderRadius.borderRadius_md,
          border: KThemeBorders.border_md),
    );
  }
}
