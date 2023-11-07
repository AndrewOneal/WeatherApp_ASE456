import 'package:climate/app/ui/widgets/box_widget.dart';
import 'package:climate/app/ui/widgets/top.dart';
import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:climate/app/ui/screens/prof/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: KThemeColors.bg_darkBlue,
        ),
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(200.0),
            child: Top(),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .285,
                    height: 400.0,
                    child: Column(
                      children: [
                        Expanded(
                          child: BoxWidget(
                            color: KThemeColors.bg_darkBlue,
                            border: KThemeBorders.border_md,
                            borderRadius: KThemeBorderRadius.borderRadius_md,
                          ),
                        ),
                        SizedBox(height: KMainFlexGap),
                        Expanded(
                          child: BoxWidget(
                            color: Colors.blue,
                            border: KThemeBorders.border_md,
                            borderRadius: KThemeBorderRadius.borderRadius_md,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: KMainFlexGap,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .685,
                    height: 800,
                    child: Column(
                      children: [
                        Expanded(
                          child: BoxWidget(
                            color: KThemeColors.bg_darkBlue,
                            border: KThemeBorders.border_md,
                            borderRadius: KThemeBorderRadius.borderRadius_md,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: BoxWidget(
                                color: Colors.orange,
                                border: KThemeBorders.border_md,
                                borderRadius:
                                    KThemeBorderRadius.borderRadius_md,
                              )),
                              SizedBox(width: 16.0),
                              Expanded(
                                  child: BoxWidget(
                                color: Colors.purple,
                                border: KThemeBorders.border_md,
                                borderRadius:
                                    KThemeBorderRadius.borderRadius_md,
                              )),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Expanded(
                            child: BoxWidget(
                          color: Colors.yellow,
                          border: KThemeBorders.border_md,
                          borderRadius: KThemeBorderRadius.borderRadius_md,
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
