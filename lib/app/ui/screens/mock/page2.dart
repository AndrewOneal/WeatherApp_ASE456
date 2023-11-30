import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  Map<String, double> userSettings;
  Page2({required this.userSettings});
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late double minTemperature;
  late double maxTemperature;
  late double visibility;
  late double wind;

  late TextEditingController minTemperatureController;
  late TextEditingController maxTemperatureController;
  late TextEditingController visibilityController;
  late TextEditingController windSpeedController;

  @override
  void initState() {
    super.initState();
    // minTemperature = widget.userSettings['minTemperature'] ?? 0;
    // maxTemperature = widget.userSettings['maxTemperature'] ?? 0;
    // visibility = widget.userSettings['visibility'] ?? 0;
    // wind = widget.userSettings['wind'] ?? 0;

    minTemperatureController = TextEditingController();
    maxTemperatureController = TextEditingController();
    visibilityController = TextEditingController();
    windSpeedController = TextEditingController();
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
                    minTemperature = double.parse(value);
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
                    maxTemperature = double.parse(value);
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
                    visibility = double.parse(value);
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
                    wind = double.parse(value);
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'minTemperature':
                      parseDoubleOrNull(minTemperatureController.text),
                  'maxTemperature':
                      parseDoubleOrNull(maxTemperatureController.text),
                  'visibility': parseDoubleOrNull(visibilityController.text),
                  'wind': parseDoubleOrNull(windSpeedController.text)
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
