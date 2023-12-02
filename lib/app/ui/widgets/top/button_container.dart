import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  final Function onNavigateToPage1;
  final Function onSettingsPressed;

  ButtonContainer({
    required this.onNavigateToPage1,
    required this.onSettingsPressed,
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
            onSettingsPressed();
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
      child: GestureDetector(
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
