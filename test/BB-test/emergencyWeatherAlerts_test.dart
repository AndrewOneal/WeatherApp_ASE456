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

    expect(notification.checkEmergency(mockWeatherData), true);

    expect(
        notification.message,
        'EMERGENCY: The temperature is 212F - STAY INDOORS!\n'
        'EMERGENCY: The visibility is about 0mi - USE CAUTION WHEN DRIVING\n'
        'EMERGENCY: wind speeds are at 223 mph\n');
  });
}
