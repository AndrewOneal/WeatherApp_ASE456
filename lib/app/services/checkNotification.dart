import 'package:flutter/material.dart';

import 'weather.dart';

abstract class CheckNotification {
  static final WeatherModel weather = WeatherModel();
  Future<dynamic> checkEmergency();
  Future<dynamic> checkAlert();
}

class CheckLocation extends CheckNotification {
  var weatherData;
  bool notify = false;
  String message = '';
  var userSettings = {'temperature': true, 'visibility': true, 'wind': true};

  CheckLocation() {
    weatherData = null;
  }

  Future<dynamic> fetchData() async {
    weatherData = await CheckNotification.weather.getLocationWeather();
  }

  @override
  checkEmergency() async {
    await fetchData();
    if (weatherData != null) {
      if (weatherData['main']['temp'] > 37.78) {
        notify = true;
        message +=
            ' The temperature is ${(((weatherData['main']['temp']) * (9 / 5)) + 32).floor()}F - STAY INDOORS!\n';
      } else if (weatherData['main']['temp'] < -15) {
        print('cold emergency');
        notify = true;
        message +=
            ' The temperature is ${(((weatherData['main']['temp']) * (9 / 5)) + 32).floor()}F - STAY INDOORS\n';
      }
      if (weatherData['visibility'] < 100) {
        print('visibility emergency');
        notify = true;
        message +=
            ' The visibility is about ${(weatherData['visibility'] / 1609).floor()}mi - USE CAUTION WHEN DRIVING\n';
      }
      if (weatherData['wind']['speed'] > 44.704 || true) {
        notify = true;
        message +=
            ' wind gusts are at ${(weatherData['wind']['speed'] * 2.23694).floor()} mph\n';
      }
    }
    return notify;
  }

  @override
  checkAlert() async {
    await fetchData();
    if (weatherData != null) {
      if (userSettings['temperature']!) {
        notify = true;
        message += 'return true and apped message temp\n';
      }
      if (userSettings['visibility']!) {
        notify = true;
        message += 'return true and apped message visibility\n';
      }
      if (userSettings['wind']!) {
        notify = true;
        message += 'return true and apped message wind\n';
      }
    }
    return notify;
  }
}
