import 'package:climate/app/services/TemperatureConverter.dart';
import 'package:climate/app/services/timeUtils.dart';
import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherHighlights extends StatefulWidget {
  final dynamic weatherData;
  final Map<String, double?> userSettings;

  WeatherHighlights({required this.weatherData, required this.userSettings});

  @override
  State<WeatherHighlights> createState() => _WeatherHighlightsState();
}

class _WeatherHighlightsState extends State<WeatherHighlights> {
  @override
  Widget build(BuildContext context) {
    double thisWidth = (MediaQuery.of(context).size.width * .685);
    dynamic weatherData = widget.weatherData;
    final TimeUtils timeUtils = TimeUtils();

    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    return Container(
      padding: isMobile
          ? EdgeInsets.fromLTRB(10, 15, 10, 0)
          : EdgeInsets.fromLTRB(10, 0, 10, 10),
      width: double.infinity,
      height: isMobile ? 1220 : 450,
      decoration: BoxDecoration(
        border: KThemeBorders.border_md,
        color: KThemeColors.bg_lightBlue,
        borderRadius: KThemeBorderRadius.borderRadius_md,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sunrise & Sunset',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.sun,
                                      color: Colors.orange,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Sunrise',
                                      style: TextStyle(
                                          color: Colors.white38, fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  weatherData != null
                                      ? timeUtils.convertTimestampToTime(
                                          weatherData['sys']['sunrise'])
                                      : '-',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.solidMoon,
                                      color: KThemeColors.theme_blue,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Sunset',
                                      style: TextStyle(
                                          color: Colors.white38, fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  weatherData != null
                                      ? timeUtils.convertTimestampToTime(
                                          weatherData['sys']['sunset'])
                                      : '-',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            )
                          ],
                        )
                      ]),
                  decoration: BoxDecoration(
                    color: KThemeColors.bg_darkBlue,
                    borderRadius: KThemeBorderRadius.borderRadius_md,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Min & Max Temp',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.minus,
                                      color: Colors.orange,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Min',
                                      style: TextStyle(
                                          color: Colors.white38, fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  weatherData != null
                                      ? widget.userSettings[
                                                  'temperatureUnit'] ==
                                              0.0
                                          ? '${weatherData['main']['temp_min']}°C'
                                          : '${TemperatureConverter.celsiusToFahrenheit(weatherData['main']['temp_min'])}°F'
                                      : '-',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.plus,
                                      color: KThemeColors.theme_blue,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Max',
                                      style: TextStyle(
                                          color: Colors.white38, fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  weatherData != null
                                      ? widget.userSettings[
                                                  'temperatureUnit'] ==
                                              0.0
                                          ? '${weatherData['main']['temp_max']}°C'
                                          : '${TemperatureConverter.celsiusToFahrenheit(weatherData['main']['temp_max'])}°F'
                                      : '-',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            )
                          ],
                        )
                      ]),
                  decoration: BoxDecoration(
                    color: KThemeColors.bg_darkBlue,
                    borderRadius: KThemeBorderRadius.borderRadius_md,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wind',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.gaugeHigh,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Speed',
                                      style: TextStyle(
                                          color: Colors.white38, fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  weatherData != null
                                      ? "${weatherData['wind']['speed']}"
                                      : '-m/s',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.angleRight,
                                      color: Colors.redAccent,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Degree',
                                      style: TextStyle(
                                          color: Colors.white38, fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  weatherData != null
                                      ? weatherData['wind']['deg'].toString()
                                      : '-',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.wind,
                                      color: KThemeColors.theme_blue,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Gust',
                                      style: TextStyle(
                                          color: Colors.white38, fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  weatherData != null
                                      ? "${weatherData['wind']['gust']}"
                                      : '-m/s',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            )
                          ],
                        )
                      ]),
                  decoration: BoxDecoration(
                    color: KThemeColors.bg_darkBlue,
                    borderRadius: KThemeBorderRadius.borderRadius_md,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: KThemeColors.bg_darkBlue,
                    borderRadius: KThemeBorderRadius.borderRadius_md,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Humidity',
                        style: TextStyle(fontSize: 35),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.droplet,
                            color: Colors.lightBlueAccent,
                            size: 40,
                          ),
                          Text(
                            weatherData == null
                                ? '-%'
                                : "${weatherData['main']['humidity']}%",
                            style: TextStyle(
                                fontSize: 40,
                                color: KThemeColors.text_dimWhite,
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: KThemeColors.bg_darkBlue,
                    borderRadius: KThemeBorderRadius.borderRadius_md,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pressure',
                        style: TextStyle(fontSize: 35),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.wind,
                            color: Colors.white,
                            size: 40,
                          ),
                          Text(
                            weatherData == null
                                ? '-pha'
                                : "${weatherData['main']['pressure']}pha",
                            style: TextStyle(
                                fontSize: 40,
                                color: KThemeColors.text_dimWhite,
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: KThemeColors.bg_darkBlue,
                    borderRadius: KThemeBorderRadius.borderRadius_md,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Feels Like',
                        style: TextStyle(fontSize: 35),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.temperatureLow,
                            color: Colors.red,
                            size: 40,
                          ),
                          Text(
                            weatherData == null
                                ? '-'
                                : "${TemperatureConverter.kelvinToCelsius(weatherData['main']['feels_like'])}°C",
                            style: TextStyle(
                                fontSize: 40,
                                color: KThemeColors.text_dimWhite,
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sunrise & Sunset',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.sun,
                                          color: Colors.orange,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Sunrise',
                                          style: TextStyle(
                                              color: Colors.white38,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      weatherData != null
                                          ? timeUtils.convertTimestampToTime(
                                              weatherData['sys']['sunrise'])
                                          : '-',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.solidMoon,
                                          color: KThemeColors.theme_blue,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Sunset',
                                          style: TextStyle(
                                              color: Colors.white38,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      weatherData != null
                                          ? timeUtils.convertTimestampToTime(
                                              weatherData['sys']['sunset'])
                                          : '-',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                )
                              ],
                            )
                          ]),
                      decoration: BoxDecoration(
                        color: KThemeColors.bg_darkBlue,
                        borderRadius: KThemeBorderRadius.borderRadius_md,
                      ),
                      width: (thisWidth - 40) * 0.495,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Min & Max Temp',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.minus,
                                          color: Colors.orange,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Min',
                                          style: TextStyle(
                                              color: Colors.white38,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      weatherData != null
                                          ? widget.userSettings[
                                                      'temperatureUnit'] ==
                                                  0.0
                                              ? '${weatherData['main']['temp_min']}°C'
                                              : '${TemperatureConverter.celsiusToFahrenheit(weatherData['main']['temp_min'])}°F'
                                          : '-',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: KThemeColors.theme_blue,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Max',
                                          style: TextStyle(
                                              color: Colors.white38,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      weatherData != null
                                          ? widget.userSettings[
                                                      'temperatureUnit'] ==
                                                  0.0
                                              ? '${weatherData['main']['temp_max']}°C'
                                              : '${TemperatureConverter.celsiusToFahrenheit(weatherData['main']['temp_max'])}°F'
                                          : '-',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                )
                              ],
                            )
                          ]),
                      decoration: BoxDecoration(
                        color: KThemeColors.bg_darkBlue,
                        borderRadius: KThemeBorderRadius.borderRadius_md,
                      ),
                      width: (thisWidth - 40) * 0.495,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: (thisWidth - 60) * 0.33,
                      height: 200,
                      decoration: BoxDecoration(
                        color: KThemeColors.bg_darkBlue,
                        borderRadius: KThemeBorderRadius.borderRadius_md,
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Humidity',
                            style: TextStyle(fontSize: 35),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.droplet,
                                color: Colors.lightBlueAccent,
                                size: 40,
                              ),
                              Text(
                                weatherData == null
                                    ? '-%'
                                    : "${weatherData['main']['humidity']}%",
                                style: TextStyle(
                                    fontSize: 40,
                                    color: KThemeColors.text_dimWhite,
                                    fontWeight: FontWeight.w200),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: (thisWidth - 60) * 0.33,
                      height: 200,
                      decoration: BoxDecoration(
                        color: KThemeColors.bg_darkBlue,
                        borderRadius: KThemeBorderRadius.borderRadius_md,
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pressure',
                            style: TextStyle(fontSize: 35),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.wind,
                                color: Colors.white,
                                size: 40,
                              ),
                              Text(
                                weatherData == null
                                    ? '-pha'
                                    : "${weatherData['main']['pressure']}pha",
                                style: TextStyle(
                                    fontSize: 40,
                                    color: KThemeColors.text_dimWhite,
                                    fontWeight: FontWeight.w200),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: (thisWidth - 60) * 0.33,
                      height: 200,
                      decoration: BoxDecoration(
                        color: KThemeColors.bg_darkBlue,
                        borderRadius: KThemeBorderRadius.borderRadius_md,
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Feels Like',
                            style: TextStyle(fontSize: 35),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.temperatureLow,
                                color: Colors.red,
                                size: 40,
                              ),
                              Text(
                                weatherData != null
                                    ? widget.userSettings['temperatureUnit'] ==
                                            0.0
                                        ? '${weatherData['main']['feels_like']}°C'
                                        : '${TemperatureConverter.celsiusToFahrenheit(weatherData['main']['feels_like'])}°F'
                                    : '-',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: KThemeColors.text_dimWhite,
                                    fontWeight: FontWeight.w200),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
