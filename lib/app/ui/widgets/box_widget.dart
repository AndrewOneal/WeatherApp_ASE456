import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  final Color color;
  final BorderRadius? borderRadius;
  final Border? border;
  final double height;

  BoxWidget(
      {this.color = KThemeColors.bg_darkBlue,
      this.borderRadius,
      this.border,
      this.height = 400});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: color, borderRadius: borderRadius, border: border),
    );
  }
}
