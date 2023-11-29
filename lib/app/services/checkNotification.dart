import 'weather.dart';

main() async {
  CheckLocation location = CheckLocation();
  await location.checkEmergency();
}

abstract class CheckNotification {
  static final WeatherModel weather = WeatherModel();
  Future<dynamic> checkEmergency();
  Future<dynamic> checkAlert();
}

class CheckLocation extends CheckNotification {
  var weatherData;
  bool isEmergency = false;
  String message = '';
  CheckLocation() {
    weatherData = null;
  }

  Future<dynamic> fetchData() async {
    weatherData = await CheckNotification.weather.getLocationWeather();
  }

  @override
  checkEmergency() async {
    await fetchData();

    if (weatherData['main']['temp'] > 37.78) {
      this.isEmergency = true;
      message +=
          ' The temperature is ${(((weatherData['main']['temp']) * (9 / 5)) + 32).floor()}F - STAY INDOORS!';
    } else if (weatherData['main']['temp'] < -15) {
      print('cold emergency');
      isEmergency = true;
      message +=
          ' The temperature is ${(((weatherData['main']['temp']) * (9 / 5)) + 32).floor()}F - STAY INDOORS';
    }
    if (weatherData['visibility'] < 100) {
      print('visibility emergency');
      isEmergency = true;
      message +=
          ' The visibility is about ${(weatherData['visibility'] / 1609).floor()}mi - USE CAUTION WHEN DRIVING';
    }
    if (weatherData['wind']['gust'] > 44.704) {
      isEmergency = true;
      message +=
          ' wind gusts are at ${(weatherData['wind']['gust'] * 2.23694).floor()} mph';
    }
    return this.isEmergency;
  }

  @override
  checkAlert() async {
    print('check Alert');
  }
}
