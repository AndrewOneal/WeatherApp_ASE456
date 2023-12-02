import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  static const TextStyle logoTextStyles = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Image.asset(
        KCustomImages.cloud_rain,
        width: 50,
        fit: BoxFit.cover,
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        'Dream',
        style: TextStyle(
            fontSize: logoTextStyles.fontSize,
            fontWeight: logoTextStyles.fontWeight,
            color: KThemeColors.theme_blue),
      ),
      Text(
        'Weather',
        style: logoTextStyles,
      ),
    ]);
  }
}
