import 'package:climate/app/utilities/constants.dart';
import 'package:climate/app/utilities/custom_toast.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Function onSearch;
  final TextEditingController controller;

  CustomSearchBar({required this.controller, required this.onSearch});

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
