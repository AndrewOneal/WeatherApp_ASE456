import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoxWidget extends StatelessWidget {
  final Color color;
  final BorderRadius? borderRadius;
  final Border? border;
  final double height;
  final FaIcon faIcon;
  final String text;

  BoxWidget(
      {this.color = KThemeColors.bg_darkBlue,
      this.borderRadius,
      this.border,
      this.height = 400,
      this.faIcon = const FaIcon(
        FontAwesomeIcons.cloud,
        color: KThemeColors.bg_lightBlue,
        size: 40,
      ),
      this.text = 'asdsadsad'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          this.faIcon,
          SizedBox(width: 10),
          Text(
            this.text,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: color, borderRadius: borderRadius, border: border),
    );
  }
}
