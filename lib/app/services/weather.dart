import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'location.dart';
import 'networking.dart';

const apiKey = '994a61464f8f26f4b546d4f21f21b989';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var str = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    Uri uri = Uri.parse(str);
    NetworkHelper networkHelper = NetworkHelper(uri);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();

    Uri uri = Uri.parse(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    NetworkHelper networkHelper = NetworkHelper(uri);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Image getWeatherImage(int id) {
    // Group 2xx: Thunderstorm
    if (id >= 200 && id <= 232) {
      return Image.asset(
        KCustomImages.cloud_thunder,
        width: 70,
        fit: BoxFit.cover,
      );
    }
    // Group 3xx: Drizzle
    else if (id >= 300 && id <= 321) {
      return Image.asset(
        KCustomImages.cloud_diagonalRain,
        width: 70,
        fit: BoxFit.cover,
      );
    }
    // Group 5xx: Rain
    else if (id >= 500 && id <= 531) {
      return Image.asset(
        KCustomImages.cloud_rain,
        width: 70,
        fit: BoxFit.cover,
      );
    }
    // Group 6xx: snow
    else if (id >= 600 && id <= 631) {
      return Image.asset(
        KCustomImages.cloud_snow,
        width: 70,
        fit: BoxFit.cover,
      );
    }
    // Group 7xx: atmosphere
    else if (id >= 700 && id <= 781) {
      return Image.asset(
        KCustomImages.cloud_wind,
        width: 70,
        fit: BoxFit.cover,
      );
    }
    // Group 8xx: clear/cloud
    else if (id >= 800 && id <= 804) {
      return id == 800
          ? Image.asset(
              KCustomImages.sun_normal,
              width: 70,
              fit: BoxFit.cover,
            )
          : Image.asset(
              KCustomImages.cloud,
              width: 70,
              fit: BoxFit.cover,
            );
    }
    // Default icon for unknown weather
    return Image.asset(
      KCustomImages.cloud_rain,
      width: 70,
      fit: BoxFit.cover,
    );
  }
}
