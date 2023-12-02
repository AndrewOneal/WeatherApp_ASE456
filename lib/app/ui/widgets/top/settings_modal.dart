import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';

class SettingsModal extends StatefulWidget {
  final Function onClose;
  final String currentTemp;
  final Function updateTempCallback;

  SettingsModal({
    required this.onClose,
    required this.currentTemp,
    required this.updateTempCallback,
  });

  @override
  State<SettingsModal> createState() => _SettingsModalState();
}

class _SettingsModalState extends State<SettingsModal> {
  List<String> temperatureOptions = ['Kelvin', 'Celsius', 'Fahrenheit'];
  String _currentTemp = 'Celsius';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double dialogWidth = screenWidth * 0.4;
    print('SettingsModal rebuild');
    // temperatureOptions
    //     .where((temp) => temp != currentTemp)
    //     .map<String>((String e) {
    //   return e;
    // });

    return Center(
      child: Container(
        width: dialogWidth,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: KThemeBorderRadius.borderRadius_sm,
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      'Current To',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8.0),
                    DropdownButton<String>(
                      value: _currentTemp,
                      onChanged: (String? newTemp) {
                        widget.updateTempCallback(newTemp);
                        setState(() {
                          _currentTemp = newTemp!;
                        });
                      },
                      items: temperatureOptions
                          .map<DropdownMenuItem<String>>((String temp) {
                        return DropdownMenuItem<String>(
                          value: temp,
                          child: Text(temp),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () {
                    widget.onClose();
                  },
                  child: Text('Close'),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: KThemeColors.bg_lightBlue,
              borderRadius: KThemeBorderRadius.borderRadius_sm,
            ),
          ),
        ),
      ),
    );
  }
}
