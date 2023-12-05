import 'package:climate/app/ui/widgets/top/button_container.dart';
import 'package:climate/app/ui/widgets/top/logo.dart';
import 'package:climate/app/ui/widgets/top/search_bar.dart';
import 'package:climate/app/ui/widgets/top/settings_modal.dart';
import 'package:flutter/material.dart';

class Top extends StatelessWidget {
  final Function onSearch;
  final Function onNavigateToPage1;
  //final Function updateTempCallback;
  final Function onNavigateToPage2;

  final TextEditingController _searchController = TextEditingController();

  Top(
      {required this.onSearch,
      required this.onNavigateToPage1,
      //required this.updateTempCallback,
      required this.onNavigateToPage2});

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
                    CustomSearchBar(
                        controller: _searchController, onSearch: onSearch),
                    ButtonContainer(
                      onNavigateToPage1: onNavigateToPage1,
                      onSettingsPressed: onNavigateToPage2,
                    )
                  ],
                ),
              ],
            )
          : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Logo(),
              CustomSearchBar(
                  controller: _searchController, onSearch: onSearch),
              ButtonContainer(
                onNavigateToPage1: onNavigateToPage1,
                onSettingsPressed: onNavigateToPage2,
              )
            ]),
    );
  }
}
