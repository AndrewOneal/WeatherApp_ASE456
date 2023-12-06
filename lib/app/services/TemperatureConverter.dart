class TemperatureConverter {
  static String celsiusToKelvin(double celsius) =>
      (celsius + 273.15).toStringAsFixed(2);

  static String celsiusToFahrenheit(double celsius) =>
      (celsius * 9 / 5 + 32).toStringAsFixed(2);

  static String kelvinToCelsius(double kelvin) =>
      (kelvin - 273.15).toStringAsFixed(2);

  static String kelvinToFahrenheit(double kelvin) =>
      ((kelvin - 273.15) * 9 / 5 + 32).toStringAsFixed(2);

  static String fahrenheitToCelsius(double fahrenheit) =>
      ((fahrenheit - 32) * 5 / 9).toStringAsFixed(2);

  static String fahrenheitToKelvin(double fahrenheit) =>
      ((fahrenheit - 32) * 5 / 9 + 273.15).toStringAsFixed(2);
}
