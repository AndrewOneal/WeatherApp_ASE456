import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  final Color color;
  final BorderRadius? borderRadius;
  final Border? border;

  BoxWidget(
      {this.color = KThemeColors.bg_darkBlue, this.borderRadius, this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: borderRadius, border: border),
    );
  }
}
