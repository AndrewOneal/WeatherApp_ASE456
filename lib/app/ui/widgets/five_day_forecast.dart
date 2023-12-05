import 'package:climate/app/services/TemperatureConverter.dart';
import 'package:climate/app/services/timeUtils.dart';
import 'package:climate/app/services/weather.dart';
import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FiveDayForecast extends StatefulWidget {
  final dynamic weatherData;
  final Function navToMoreDataScreen;

  FiveDayForecast(
      {required this.weatherData, required this.navToMoreDataScreen});
  @override
  State<FiveDayForecast> createState() => _FiveDayForecastState();
}

class _FiveDayForecastState extends State<FiveDayForecast> {
  @override
  Widget build(BuildContext context) {
    dynamic weatherData = widget.weatherData;
    final WeatherModel weatherModel = WeatherModel();

    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: KThemeColors.bg_lightBlue,
        borderRadius: KThemeBorderRadius.borderRadius_md,
        border: KThemeBorders.border_md,
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          //color: KThemeColors.bg_darkBlue, // Expanded Blue section
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(width: 10.0),
                  Text(
                    '5-Day Forecast',
                    style: TextStyle(fontSize: 28),
                  ),
                  Text(
                    '\n(Date): X degrees'
                    '\n\n(Date): X degrees'
                    '\n\n(Date): X degrees'
                    '\n\n(Date): X degrees'
                    '\n\n(Date): X degrees',
                    style: TextStyle(fontSize: 23),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
