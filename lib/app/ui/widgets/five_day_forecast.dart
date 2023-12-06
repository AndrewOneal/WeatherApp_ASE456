import 'package:climate/app/services/TemperatureConverter.dart';
import 'package:flutter/material.dart';
import 'package:climate/app/services/darkModeChanger.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:climate/app/utilities/constants.dart';

class FiveDayForecast extends StatefulWidget {
  final Map<String, dynamic> weatherData;
  final Map<String, double?> userSettings;

  FiveDayForecast({required this.weatherData, required this.userSettings});

  @override
  State<FiveDayForecast> createState() => _FiveDayForecastState();
}

class _FiveDayForecastState extends State<FiveDayForecast> {
  late var textColor;

  Map<String, dynamic> dailySummaries = {};
  @override
  void initState() {
    super.initState();
    this.getFiveDayForecast();
    textColor = DarkModeChanger.toggleDarkLightText(widget.userSettings);
  }

  Future<void> getFiveDayForecast() async {
    if (widget.weatherData.containsKey('coord')) {
      final apiKey = '7f3c31771e30e2e03d2f2a5e6b49db90';
      final lat = widget.weatherData['coord']['lat'];
      final lon = widget.weatherData['coord']['lon'];

      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric',
        ),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var forecastList = data['list'] as List<dynamic>;
        Map<String, List<dynamic>> groupedForecast = {};

        for (var weatherData in forecastList) {
          DateTime date =
              DateTime.fromMillisecondsSinceEpoch(weatherData['dt'] * 1000);
          String dateKey = "${date.year}-${date.month}-${date.day}";

          if (!groupedForecast.containsKey(dateKey)) {
            groupedForecast[dateKey] = [];
          }
          groupedForecast[dateKey]!.add(weatherData);
        }

        groupedForecast.forEach(
          (key, value) {
            double avgTemp = value
                    .map<double>((item) => item['main']['temp'])
                    .reduce((a, b) => a + b) /
                value.length;
            String mainCondition = value[0]['weather'][0]['main'];

            setState(
              () {
                dailySummaries[key] = {
                  'avgTemp': avgTemp,
                  'mainCondition': mainCondition
                };
              },
            );
          },
        );
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }

  Widget buildForecastCard(String date, Map<String, dynamic> summary) {
    return Card(
      color: KThemeColors.bg_darkBlue,
      child: ListTile(
        title: Text(date),
        subtitle: Text(widget.userSettings['temperatureUnit'] == 0
            ? "Avg Temp: ${summary['avgTemp'].toStringAsFixed(2)} °C \nCondition: ${summary['mainCondition']}"
            : "Avg Temp: ${TemperatureConverter.celsiusToFahrenheit(summary['avgTemp'])} °F \nCondition: ${summary['mainCondition']}"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: DarkModeChanger.toggleDarkLightText(widget.userSettings)),
          color: DarkModeChanger.toggleDarkLightBG(widget.userSettings)),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '5-Day Forecast',
                style: TextStyle(
                    fontSize: 28,
                    color: DarkModeChanger.toggleDarkLightText(
                        widget.userSettings)),
              ),
              if (dailySummaries.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: dailySummaries.keys.map((date) {
                    return buildForecastCard(date, dailySummaries[date]!);
                  }).toList(),
                )
              else
                Text(
                  'No forecast data available.',
                  style: TextStyle(fontSize: 23),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
