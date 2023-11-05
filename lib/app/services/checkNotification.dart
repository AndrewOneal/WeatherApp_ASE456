import 'weather.dart';

// main() async {
//   CheckLocation location = CheckLocation();
//   await location.checkEmergency();
// }

abstract class Check {
  static final WeatherModel weather = WeatherModel();
  Future<dynamic> checkEmergency();
  Future<dynamic> checkAlert();
}

class CheckLocation extends Check {
  var weatherData;
  CheckLocation() {
    weatherData = null;
    String message = '';
    bool isEmergency = false;
  }

  Future<dynamic> fetchData() async {
    weatherData = await Check.weather.getLocationWeather();
  }

  @override
  checkEmergency() async {
    await fetchData();

    //List of emergencies to detect:
    //wind gust > 40mph
    //temp > 100F
    // >50mm of rainfall/snow
    // visibility < 100m
    if (weatherData['main']['temp'] > 37.78) {
      print('there will be an emergency');
      //append emergency string to message
      //set isEmergency to True
    }
  }

  @override
  checkAlert() async {
    print('check Alert');
  }
}
