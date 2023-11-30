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

  @override
  void initState() {
    super.initState();
    minTemperature = widget.userSettings['minTemperature'] ?? 0;
    maxTemperature = widget.userSettings['maxTemperature'] ?? 0;
    visibility = widget.userSettings['visibility'] ?? 0;
    wind = widget.userSettings['wind'] ?? 0;
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
                onChanged: (value) {
                  setState(() {
                    visibility = double.parse(value);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Min Wind Speed to be notified'),
              subtitle: TextFormField(
                keyboardType: TextInputType.number,
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
                    'minTemperature': minTemperature,
                    'maxTemperature': maxTemperature,
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
