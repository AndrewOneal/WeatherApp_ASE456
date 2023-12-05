import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';

class MoreData extends StatefulWidget {
  final dynamic weatherData;

  MoreData({required this.weatherData});

  @override
  State<MoreData> createState() => _MoreDataState();
}

class _MoreDataState extends State<MoreData> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    double width = isMobile ? screenWidth : screenWidth / 3;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'More Weather Data',
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'For the aficionados we build 🤓',
                  style: TextStyle(
                    color: KThemeColors.theme_blue,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: width,
                  child: Table(
                    border: TableBorder.all(
                      color: KThemeColors.text_dimWhite,
                      borderRadius: KThemeBorderRadius.borderRadius_sm,
                    ),
                    columnWidths: {
                      0: FlexColumnWidth(1), // Weather Attribute column
                      1: FlexColumnWidth(1), // Weather Data column
                    },
                    children: [
                      buildTableRow(['Weather Attribute', 'Weather Data'],
                          isHeader: true),
                      buildTableRow(
                          ['Lon', "${widget.weatherData['coord']['lon']}"]),
                      buildTableRow(
                          ['Lat', "${widget.weatherData['coord']['lat']}"]),
                      buildTableRow(
                          ['Lon', "${widget.weatherData['coord']['lon']}"]),
                      buildTableRow(
                          ['Temp', "${widget.weatherData['main']['temp']}°K"]),
                      buildTableRow([
                        'Min_Temp',
                        "${widget.weatherData['main']['temp_min']}°K"
                      ]),
                      buildTableRow([
                        'Max_Temp',
                        "${widget.weatherData['main']['temp_max']}°K"
                      ]),
                      buildTableRow([
                        'Pressure',
                        "${widget.weatherData['main']['pressure']}pha"
                      ]),
                      buildTableRow([
                        'Humidity',
                        "${widget.weatherData['main']['humidity']}"
                      ]),
                      buildTableRow([
                        'Sea Level',
                        "${widget.weatherData['main']['sea_level']}"
                      ]),
                      buildTableRow([
                        'Ground Level',
                        "${widget.weatherData['main']['grnd_level']}"
                      ]),
                      buildTableRow([
                        'visibility',
                        "${widget.weatherData['visibility']}"
                      ]),
                      buildTableRow([
                        'Wind Speed',
                        "${widget.weatherData['wind']['speed']}m/s"
                      ]),
                      buildTableRow(
                          ['Clouds', "${widget.weatherData['clouds']['all']}"]),
                      buildTableRow([
                        'Country',
                        "${widget.weatherData['sys']['country']}"
                      ]),
                      buildTableRow(['City', "${widget.weatherData['name']}"]),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(color: KThemeColors.bg_darkBlue),
          ),
        ),
      ),
    );
  }

  TableRow buildTableRow(List<String> cells, {bool isHeader = false}) {
    int index = 0; // Keep track of the cell index to alternate colors
    return TableRow(
      children: cells.map((cellText) {
        final textColor =
            (index % 2 == 0) ? KThemeColors.pinkish : KThemeColors.yellowish;
        index++;
        return TableCell(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: CustomText(
              text: cellText,
              isHeader: isHeader,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                decoration: TextDecoration.none,
                fontSize: 25,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final bool isHeader;
  final TextStyle textStyle;

  CustomText({
    required this.text,
    this.isHeader = false,
    this.textStyle = const TextStyle(
      decoration: TextDecoration.none,
      fontSize: 15.0,
      color: KThemeColors.text_whiteWhite,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isHeader
          ? textStyle.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
              fontSize: 25.0,
              color: KThemeColors.theme_blue,
            )
          : textStyle,
    );
  }
}
