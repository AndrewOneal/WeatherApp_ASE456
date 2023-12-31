import 'package:climate/app/services/TemperatureConverter.dart';
import 'package:climate/app/services/timeUtils.dart';
import 'package:climate/app/services/weather.dart';
import 'package:climate/app/services/darkModeChanger.dart';
import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherTinyInfo extends StatefulWidget {
  final dynamic weatherData;
  final Function navToMoreDataScreen;
  final Map<String, double?> userSettings;

  WeatherTinyInfo(
      {required this.weatherData,
      required this.navToMoreDataScreen,
      required this.userSettings});

  @override
  State<WeatherTinyInfo> createState() => _WeatherTinyInfoState();
}

class _WeatherTinyInfoState extends State<WeatherTinyInfo> {
  // Get the dark mode's changed color
  late var textColor;
  @override
  void initState() {
    super.initState();
    textColor = DarkModeChanger.toggleDarkLightText(widget.userSettings);
  }

  @override
  Widget build(BuildContext context) {
    dynamic weatherData = widget.weatherData;
    final TimeUtils timeUtils = TimeUtils();
    final WeatherModel weatherModel = WeatherModel();

    return Container(
      padding: weatherData == null
          ? EdgeInsets.all(20)
          : EdgeInsets.fromLTRB(20, 10, 20, 10),
      height: 400,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                weatherData != null
                    ? weatherModel
                        .getWeatherImage(weatherData['weather'][0]['id'])
                    : FaIcon(
                        FontAwesomeIcons.ban,
                        color: Colors.lightBlueAccent,
                        size: 30,
                      ),
                SizedBox(width: 10.0),
                Text(
                  'Now',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: DarkModeChanger.toggleDarkLightText(
                          widget.userSettings)),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => widget.navToMoreDataScreen(),
              child: Center(child: Text('More Data')),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: KThemeBorderRadius.borderRadius_xs,
                    side: BorderSide(
                        color: DarkModeChanger.toggleDarkLightText(
                            widget.userSettings)),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                    DarkModeChanger.toggleDarkLightBG(widget.userSettings)),
                foregroundColor: MaterialStateProperty.all<Color>(
                    DarkModeChanger.toggleDarkLightText(widget.userSettings)),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.fromLTRB(30, 18, 30, 18),
                ),
              ),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              weatherData != null
                  ? widget.userSettings['temperatureUnit'] == 0.0
                      ? '${weatherData['main']['temp'].toString()}°C'
                      : '${TemperatureConverter.celsiusToFahrenheit(weatherData['main']['temp'])}°F'
                  : '-',
              style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.w400,
                  color:
                      DarkModeChanger.toggleDarkLightText(widget.userSettings)),
            ),
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weatherData == null ? '-' : weatherData['weather'][0]['main'],
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: DarkModeChanger.toggleDarkLightText(
                        widget.userSettings)),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.white24,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.calendar,
                    color: KThemeColors.theme_blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    timeUtils.getCurrentTime(),
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: DarkModeChanger.toggleDarkLightText(
                            widget.userSettings)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.locationDot,
                    color: Colors.red[400],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    weatherData == null
                        ? "-"
                        : "${weatherData['name']}, ${weatherData['sys']['country']}",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: DarkModeChanger.toggleDarkLightText(
                            widget.userSettings)),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
          // Changes the backgournd color based on the dark mode value
          color: DarkModeChanger.toggleDarkLightBG(widget.userSettings),
          borderRadius: KThemeBorderRadius.borderRadius_md,
          border: KThemeBorders.border_md),
    );
  }
}
