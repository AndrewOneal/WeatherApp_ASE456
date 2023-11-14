import 'dart:math';

import 'package:climate/app/utilities/constants.dart';
import 'package:climate/app/utilities/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Top extends StatelessWidget {
  final Function onSearch;
  final Function onNavigateToPage1;
  final Function onNavigateToPage2;

  final TextEditingController _searchController = TextEditingController();

  Top({
    required this.onSearch,
    required this.onNavigateToPage1,
    required this.onNavigateToPage2,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    return Container(
      height: isMobile ? 200 : 80.0,
      padding: EdgeInsets.all(20),
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchBar(
                        controller: _searchController, onSearch: onSearch),
                    ButtonContainer(
                        onNavigateToPage1: onNavigateToPage1,
                        onNavigateToPage2: onNavigateToPage2)
                  ],
                ),
              ],
            )
          : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Logo(),
              SearchBar(controller: _searchController, onSearch: onSearch),
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
  final TextEditingController controller;

  SearchBar({required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;

    return Container(
      height: isMobile ? 35 : 50,
      padding:
          isMobile ? EdgeInsets.fromLTRB(15, 15, 0, 0) : EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: KThemeColors.bg_lightBlue,
        borderRadius: isMobile
            ? KThemeBorderRadius.borderRadius_xs
            : KThemeBorderRadius.borderRadius_sm,
        border: KThemeBorders.border_md,
      ),
      child: isMobile
          ? Container(
              width: 180,
              alignment: Alignment.center,
              child: TextField(
                controller: controller,
                style: TextStyle(
                  color: Colors.white,
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    onSearch(value);
                  } else {
                    ToastManager.showWarning('Please enter a city name');
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter City Name",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            )
          : Row(
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
                    controller: controller,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        onSearch(value);
                      } else {
                        ToastManager.showWarning('Please enter a city name');
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Enter City Name",
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
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
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
        SizedBox(width: isMobile ? 10 : 16.0),
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
