import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

class KThemeColors {
  static const Color bg_darkBlue = Color(0xFF12161B);
  static const Color bg_lightBlue = Color(0XFF191F27);
  static final Color text_dimWhite = Color(0xFFFFFFFF).withOpacity(0.75);
  static const Color text_whiteWhite = Color(0xFFFFFFFF);
  static const Color theme_blue = Color(0xFF19ABBF);

  static const Color pinkish = Color(0xFFff416a);
  static const Color yellowish = Color(0xFFfebc11);
  static const Color purplish = Color(0xFF6947ef);
}

class KThemeBorders {
  static final Border border_sm = Border.all(
    color: Colors.white,
    width: 0.2,
  );
  static final Border border_md = Border.all(
    color: Colors.white,
    width: 0.8,
  );
  static final Border border_lg = Border.all(
    color: Colors.white,
    width: 1.2,
  );
}

class KThemeBorderRadius {
  static final BorderRadius borderRadius_xs = BorderRadius.circular(6.0);
  static final BorderRadius borderRadius_sm = BorderRadius.circular(8.0);
  static final BorderRadius borderRadius_md = BorderRadius.circular(16.0);
  static final BorderRadius borderRadius_lg = BorderRadius.circular(24.0);
  static final BorderRadius borderRadius_xl = BorderRadius.circular(32.0);
}

const KMainFlexGap = 10.0;

class KCustomImages {
  static const String cloud_thunder = 'lib/assets/images/1.png';
  static const String cloud_rain = 'lib/assets/images/2.png';
  static const String cloud_diagonalRain = 'lib/assets/images/3.png';
  static const String cloud_snow = 'lib/assets/images/4.png';
  static const String cloud_wind = 'lib/assets/images/5.png';
  static const String sun_normal = 'lib/assets/images/6.png';
  static const String cloud_sun = 'lib/assets/images/7.png';
  static const String cloud = 'lib/assets/images/8.png';
  static const String cloud_blueWind = 'lib/assets/images/9.png';
  static const String sun_abnormal = 'lib/assets/images/11.png';
  static const String moon = 'lib/assets/images/12.png';
  static const String thermometer_hot = 'lib/assets/images/13.png';
  static const String thermometer_cold = 'lib/assets/images/14.png';
}
