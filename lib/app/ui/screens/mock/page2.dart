import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  Map<String, double?> userSettings;
  Page2({required this.userSettings});
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late double? minTemperature;
  late double? maxTemperature;
  late double? visibility;
  late double? wind;

  late TextEditingController minTemperatureController;
  late TextEditingController maxTemperatureController;
  late TextEditingController visibilityController;
  late TextEditingController windSpeedController;
  String? temperature = 'Celcius';

  @override
  void initState() {
    super.initState();
    minTemperature = widget.userSettings['minTemperature'];
    maxTemperature = widget.userSettings['maxTemperature'];
    visibility = widget.userSettings['visibility'];
    wind = widget.userSettings['wind'];

    minTemperatureController = TextEditingController(
        text: minTemperature != null ? minTemperature.toString() : '');
    maxTemperatureController = TextEditingController(
        text: maxTemperature != null ? maxTemperature.toString() : '');
    visibilityController = TextEditingController(
        text: visibility != null ? visibility.toString() : '');
    windSpeedController =
        TextEditingController(text: wind != null ? wind.toString() : '');
    temperature =
        widget.userSettings['temperatureUnit'] == 0 ? 'Celcius' : 'Farenheight';
  }

  double? parseDoubleOrNull(String input) {
    try {
      return double.parse(input);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: const Text('Min Temperature to be notified'),
              subtitle: TextFormField(
                keyboardType: TextInputType.number,
                controller: minTemperatureController,
                onChanged: (value) {
                  setState(() {
                    minTemperature = parseDoubleOrNull(value);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Max Temperature to be notified'),
              subtitle: TextFormField(
                keyboardType: TextInputType.number,
                controller: maxTemperatureController,
                onChanged: (value) {
                  setState(() {
                    maxTemperature = parseDoubleOrNull(value);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Min Visibility to be notified'),
              subtitle: TextFormField(
                keyboardType: TextInputType.number,
                controller: visibilityController,
                onChanged: (value) {
                  setState(() {
                    visibility = parseDoubleOrNull(value);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Max Wind Speed to be notified'),
              subtitle: TextFormField(
                keyboardType: TextInputType.number,
                controller: windSpeedController,
                onChanged: (value) {
                  setState(() {
                    wind = parseDoubleOrNull(value);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Change Temperature Value'),
              subtitle: DropdownButton<String>(
                value: temperature,
                items: ['Celcius', 'Farenheight']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    temperature = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'minTemperature': minTemperature,
                  'maxTemperature': maxTemperature,
                  'visibility': visibility,
                  'wind': wind,
                  'temperatureUnit': temperature == 'Celcius' ? 0.0 : 1.0,
                });
              },
              child: const Text('Save Settings'),
            )
          ],
        ),
      ),
    );
  }
}
