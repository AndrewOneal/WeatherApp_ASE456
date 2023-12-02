import 'package:climate/app/services/weather.dart';
import 'package:test/test.dart';

void main() {
  test('getMessage returns the correct message based on temperature', () {
    WeatherModel weatherModel = WeatherModel();

    expect(weatherModel.getMessage(26), 'It\'s 🍦 time');

    expect(weatherModel.getMessage(22), 'Time for shorts and 👕');

    expect(weatherModel.getMessage(5), 'You\'ll need 🧣 and 🧤');

    expect(weatherModel.getMessage(15), 'Bring a 🧥 just in case');
  });
}
