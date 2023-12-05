import 'package:climate/app/services/checkNotification.dart';
import 'package:test/test.dart';

void main() {
  test(
      'Weather Alarms return the correct message based on user settings and weather conditions',
      () {
    CheckLocation notification = CheckLocation();
    Map<dynamic, dynamic> mockWeatherData = {
      'main': {'temp': 100},
      'visibility': 50,
      'wind': {'speed': 100}
    };
    Map<String, double?> mockUserSettings = {
      'minTemperature': 100,
      'maxTemperature': 0,
      'visibility': 100,
      'wind': 0,
      'temperatureUnit': 0
    };

    expect(notification.checkAlert(mockWeatherData, mockUserSettings), true);

    expect(
        notification.message,
        'ALERT: The temperature is 100\n'
        'ALERT: The temperature is 100\n'
        'ALERT: The visibility is about 0mi\n'
        'ALERT: wind speeds are at 223 mph\n');
  });
}
