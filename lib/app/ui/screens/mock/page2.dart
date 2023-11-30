import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  Map<String, bool> userSettings;
  Page2({required this.userSettings});
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late bool temperature;
  late bool visibility;
  late bool wind;

  @override
  void initState() {
    super.initState();
    temperature = widget.userSettings['temperature'] ?? false;
    visibility = widget.userSettings['visibility'] ?? false;
    wind = widget.userSettings['wind'] ?? false;
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
            CheckboxListTile(
              title: const Text('Notify Temperature (high and low)'),
              value: temperature,
              onChanged: (newValue) {
                setState(() {
                  temperature = newValue ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Notify Visibility'),
              value: visibility,
              onChanged: (newValue) {
                setState(() {
                  visibility = newValue ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Notify Wind High Speeds'),
              value: wind,
              onChanged: (newValue) {
                setState(() {
                  wind = newValue ?? false;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {
                    'temperature': temperature,
                    'visibility': visibility,
                    'wind': wind
                  });
                },
                child: const Text('Save Settings'))
          ],
        ),
      ),
    );
  }
}
