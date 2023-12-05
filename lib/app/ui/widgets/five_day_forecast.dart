import 'package:climate/app/services/TemperatureConverter.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FiveDayForecast extends StatefulWidget {
  final Map<String, dynamic> weatherData;
  final Map<String, double?> userSettings;

  FiveDayForecast({required this.weatherData, required this.userSettings});

  @override
  State<FiveDayForecast> createState() => _FiveDayForecastState();
}

class _FiveDayForecastState extends State<FiveDayForecast> {
  Map<String, dynamic> dailySummaries = {};
  @override
  void initState() {
    super.initState();
    this.getFiveDayForecast();
  }

  Future<void> getFiveDayForecast() async {
    if (widget.weatherData.containsKey('coord')) {
      final apiKey =
          '7f3c31771e30e2e03d2f2a5e6b49db90'; // Replace with your API key
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

        // print('FORECAST LIST::: $forecastList');

        // Grouping data by date
        for (var weatherData in forecastList) {
          DateTime date =
              DateTime.fromMillisecondsSinceEpoch(weatherData['dt'] * 1000);
          String dateKey = "${date.year}-${date.month}-${date.day}";

          if (!groupedForecast.containsKey(dateKey)) {
            groupedForecast[dateKey] = [];
          }
          groupedForecast[dateKey]!.add(weatherData);
        }

        // Processing each group to create daily summaries
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
            // Example: using first condition of the day
          },
        );
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }

  Widget buildForecastCard(String date, Map<String, dynamic> summary) {
    return Card(
      color: Colors.transparent,
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
          border: Border.all(color: Colors.white),
          color: Color.fromARGB(255, 25, 31, 39)),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '5-Day Forecast',
                style: TextStyle(fontSize: 28),
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
