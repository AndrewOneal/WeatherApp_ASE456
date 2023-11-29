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
      print('there will be an emergency');
      isEmergency = true;
      message += 'There is a heat emergency outside';
    }
    return this.isEmergency;
  }

  @override
  checkAlert() async {
    print('check Alert');
  }
}
