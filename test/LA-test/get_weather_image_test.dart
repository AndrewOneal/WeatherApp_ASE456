import 'package:climate/app/services/weather.dart';
import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

void main() {
  group('WeatherModel', () {
    test(
        'getWeatherImage should return the correct Image asset string for weather conditions',
        () {
      WeatherModel weatherModel = WeatherModel();

      // Testing each weather condition | see if the image asset string is wts expected
      expect((weatherModel.getWeatherImage(201).image as AssetImage).assetName,
          KCustomImages.cloud_thunder);
      expect((weatherModel.getWeatherImage(321).image as AssetImage).assetName,
          KCustomImages.cloud_diagonalRain);
      expect((weatherModel.getWeatherImage(502).image as AssetImage).assetName,
          KCustomImages.cloud_rain);
      expect((weatherModel.getWeatherImage(611).image as AssetImage).assetName,
          KCustomImages.cloud_snow);
      expect((weatherModel.getWeatherImage(741).image as AssetImage).assetName,
          KCustomImages.cloud_wind);
      expect((weatherModel.getWeatherImage(800).image as AssetImage).assetName,
          KCustomImages.sun_normal);
      expect((weatherModel.getWeatherImage(804).image as AssetImage).assetName,
          KCustomImages.cloud);

      // Test for unknown weather condition
      expect((weatherModel.getWeatherImage(900).image as AssetImage).assetName,
          KCustomImages.cloud_rain);
    });
  });
}
