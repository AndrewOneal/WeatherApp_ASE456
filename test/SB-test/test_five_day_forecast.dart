import 'package:climate/app/services/darkModeChanger.dart';
import 'package:climate/app/services/TemperatureConverter.dart';
import 'package:climate/app/ui/widgets/five_day_forecast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('Tests the forecast card builder', () {
    FiveDayForecast myForecast = FiveDayForecast(weatherData: {
      'main': {'temp': 100},
      'wind': {'speed': 100}
    }, userSettings: {
      'temperatureUnit': 1
    });
    //myForecast.buildForecastCard("12/5/23", 60)
  });
}
