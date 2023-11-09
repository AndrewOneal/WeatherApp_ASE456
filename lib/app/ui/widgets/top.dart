import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Top extends StatelessWidget {
  final Function onSearch;
  final Function onNavigateToPage1;
  final Function onNavigateToPage2;

  Top({
    required this.onSearch,
    required this.onNavigateToPage1,
    required this.onNavigateToPage2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      padding: EdgeInsets.all(20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Logo(),
        SearchBar(onSearch: onSearch),
        ButtonContainer(
          onNavigateToPage1: onNavigateToPage1,
          onNavigateToPage2: onNavigateToPage2,
        )
      ]),
    );
  }
}

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

class SearchBar extends StatelessWidget {
  final Function onSearch;

  SearchBar({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: KThemeBorderRadius.borderRadius_sm,
        border: KThemeBorders.border_md,
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(width: 8.0),
          Container(
            width: 700,
            alignment: Alignment.center,
            child: TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              onSubmitted: (value) {
                onSearch();
              },
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: 8.0),
        ],
      ),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  final Function onNavigateToPage1;
  final Function onNavigateToPage2;

  ButtonContainer({
    required this.onNavigateToPage1,
    required this.onNavigateToPage2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCircularIconButton(
          context,
          KThemeColors.theme_blue.withOpacity(.25),
          Icons.location_on,
          KThemeColors.theme_blue,
          () {
            onNavigateToPage1();
          },
        ),
        SizedBox(width: 16.0),
        _buildCircularIconButton(
          context,
          Color.fromRGBO(255, 255, 255, .23),
          Icons.settings,
          KThemeColors.text_whiteWhite,
          () {
            onNavigateToPage2();
          },
        ),
      ],
    );
  }

  Widget _buildCircularIconButton(
    BuildContext context,
    Color bgColor,
    IconData icon,
    Color iconColor,
    VoidCallback onTap,
  ) {
    return Material(
      shape: CircleBorder(),
      color: bgColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(48.0),
        onTap: onTap,
        child: Container(
          width: 48.0,
          height: 48.0,
          child: Center(
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
