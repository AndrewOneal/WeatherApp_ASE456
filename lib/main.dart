import 'package:climate/app/services/checkNotification.dart';
import 'package:climate/app/services/weather.dart';
import 'package:climate/app/ui/screens/mock/page1.dart';
import 'package:climate/app/ui/screens/mock/page2.dart';
import 'package:climate/app/ui/widgets/box_widget.dart';
import 'package:climate/app/ui/widgets/top.dart';
import 'package:climate/app/ui/widgets/weather_highlights.dart';
import 'package:climate/app/ui/widgets/weather_tiny_info.dart';
import 'package:climate/app/utilities/constants.dart';
import 'package:climate/app/utilities/custom_toast.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: KThemeColors.bg_darkBlue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final WeatherModel weatherModel = WeatherModel();

  bool isLoading = true;
  String searchParam = '';
  var weatherData;
  var pastWeatherData;
  CheckLocation location = CheckLocation();

  @override
  void initState() {
    super.initState();
    _init_weatherData();

    Future.delayed(Duration.zero, () async {
      if (await checkLocationEmergency()) {
        showMaterialBanner();
      }
    });
  }

  void showMaterialBanner() {
    final actions = [
      TextButton(
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        },
        child: const Text('OK'),
      )
    ];

    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(
          'EMERGENCY! ${this.location.message}',
          style: TextStyle(color: Colors.red),
        ),
        actions: actions,
      ),
    );
  }

  void _init_weatherData() async {
    weatherData = await weatherModel.getLocationWeather();

    setState(() {
      isLoading = true;
    });
    try {
      pastWeatherData = weatherData;
      ToastManager.showSuccess(
        'Weather data retrieved successfully',
      );
    } catch (e) {
      ToastManager.showError(
        'Error fetching weather data',
      );
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void startLoading() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  void onSearch(String searchText) {
    setState(() {
      searchParam = searchText;
    });
    searchWeather();
  }

  void searchWeather() async {
    setState(() {
      isLoading = true;
    });

    try {
      if (searchParam != '') {
        weatherData = await weatherModel.getCityWeather(searchParam);
        if (weatherData == null) {
          weatherData = pastWeatherData;
          ToastManager.showError(
            'Location not found. Please check the spelling and try again.',
          );
        } else {
          pastWeatherData = weatherData;
          ToastManager.showSuccess(
            'Weather data retrieved successfully',
          );
          // print(weatherData);
        }
      } else {
        weatherData = await weatherModel.getLocationWeather();
        ToastManager.showWarning(
            'No search parameter! Weather data of current location retrieved instead.');
      }
    } catch (e) {
      ToastManager.showError('Error fetching weather data');
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void navigateToPage1() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Page1()),
    );
  }

  void navigateToPage2() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Page2()),
    );
  }

  Future<bool> checkLocationEmergency() async {
    return await this.location.checkEmergency();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: Top(
          onSearch: onSearch,
          onNavigateToPage1: navigateToPage1,
          onNavigateToPage2: navigateToPage2,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : isMobile
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          IntrinsicHeight(
                            child: WeatherTinyInfo(
                              weatherData: weatherData,
                            ),
                          ),
                          SizedBox(height: KMainFlexGap),
                          IntrinsicHeight(
                            child: WeatherHighlights(weatherData: weatherData),
                          ),
                          SizedBox(height: KMainFlexGap),
                          IntrinsicHeight(
                            child: BoxWidget(
                              color: Colors.blue,
                              border: KThemeBorders.border_md,
                              borderRadius: KThemeBorderRadius.borderRadius_md,
                            ),
                          ),
                          SizedBox(height: KMainFlexGap),
                          BoxWidget(
                            color: Colors.orange,
                            border: KThemeBorders.border_md,
                            borderRadius: KThemeBorderRadius.borderRadius_md,
                            height: 300,
                          ),
                          SizedBox(height: KMainFlexGap),
                          BoxWidget(
                            color: Colors.purple,
                            border: KThemeBorders.border_md,
                            borderRadius: KThemeBorderRadius.borderRadius_md,
                            height: 300,
                          ),
                        ],
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .285,
                          child: Column(
                            children: [
                              IntrinsicHeight(
                                child: WeatherTinyInfo(
                                  weatherData: weatherData,
                                ),
                              ),
                              SizedBox(height: KMainFlexGap),
                              IntrinsicHeight(
                                child: BoxWidget(
                                  color: Colors.blue,
                                  border: KThemeBorders.border_md,
                                  borderRadius:
                                      KThemeBorderRadius.borderRadius_md,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: KMainFlexGap,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .685,
                          height: 1200,
                          child: Column(
                            children: [
                              IntrinsicHeight(
                                child:
                                    WeatherHighlights(weatherData: weatherData),
                              ),
                              SizedBox(height: KMainFlexGap),
                              Row(
                                children: [
                                  Expanded(
                                    child: BoxWidget(
                                      color: Colors.orange,
                                      border: KThemeBorders.border_md,
                                      borderRadius:
                                          KThemeBorderRadius.borderRadius_md,
                                      height: 300,
                                    ),
                                  ),
                                  SizedBox(width: KMainFlexGap),
                                  Expanded(
                                    child: BoxWidget(
                                      color: Colors.purple,
                                      border: KThemeBorders.border_md,
                                      borderRadius:
                                          KThemeBorderRadius.borderRadius_md,
                                      height: 300,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: KMainFlexGap),
                              IntrinsicHeight(
                                child: BoxWidget(
                                  color: Colors.yellow,
                                  border: KThemeBorders.border_md,
                                  borderRadius:
                                      KThemeBorderRadius.borderRadius_md,
                                  height: 300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
