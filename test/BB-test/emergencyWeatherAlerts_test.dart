import 'package:climate/app/services/checkNotification.dart';
import 'package:test/test.dart';

void main() {
  test(
      'Emergency weather alerts returns the correct message string based on weather conditions',
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
      'temperatureUnit': 1
    };

    expect(
        notification.checkEmergency(mockWeatherData, mockUserSettings), true);

    expect(
        notification.message,
        'EMERGENCY: The temperature is 212.00°F - STAY INDOORS!\n'
        'EMERGENCY: The visibility is about 0mi - USE CAUTION WHEN DRIVING\n'
        'EMERGENCY: wind speeds are at 223 mph\n');
  });
}
