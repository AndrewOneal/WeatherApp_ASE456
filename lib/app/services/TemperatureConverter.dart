class TemperatureConverter {
  // Celsius to Kelvin
  static String celsiusToKelvin(double celsius) =>
      (celsius + 273.15).toStringAsFixed(2);

  // Celsius to Fahrenheit
  static String celsiusToFahrenheit(double celsius) =>
      (celsius * 9 / 5 + 32).toStringAsFixed(2);

  // Kelvin to Celsius
  static String kelvinToCelsius(double kelvin) =>
      (kelvin - 273.15).toStringAsFixed(2);

  // Kelvin to Fahrenheit
  static String kelvinToFahrenheit(double kelvin) =>
      ((kelvin - 273.15) * 9 / 5 + 32).toStringAsFixed(2);

  // Fahrenheit to Celsius
  static String fahrenheitToCelsius(double fahrenheit) =>
      ((fahrenheit - 32) * 5 / 9).toStringAsFixed(2);

  // Fahrenheit to Kelvin
  static String fahrenheitToKelvin(double fahrenheit) =>
      ((fahrenheit - 32) * 5 / 9 + 273.15).toStringAsFixed(2);
}
