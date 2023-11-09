import 'package:climate/app/ui/screens/mock/page1.dart';
import 'package:climate/app/ui/screens/mock/page2.dart';
import 'package:climate/app/ui/widgets/box_widget.dart';
import 'package:climate/app/ui/widgets/top.dart';
import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: KThemeColors.bg_darkBlue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  void startLoading() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  void navigateToPage1() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Page1()),
    );
  }

  void navigateToPage2() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Page2()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: Top(
          onSearch: startLoading,
          onNavigateToPage1: navigateToPage1,
          onNavigateToPage2: navigateToPage2,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .285,
                      child: Column(
                        children: [
                          IntrinsicHeight(
                            child: BoxWidget(
                              color: KThemeColors.bg_darkBlue,
                              border: KThemeBorders.border_md,
                              borderRadius: KThemeBorderRadius.borderRadius_md,
                            ),
                          ),
                          SizedBox(height: KMainFlexGap),
                          IntrinsicHeight(
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
                      height: 1200,
                      child: Column(
                        children: [
                          IntrinsicHeight(
                            child: BoxWidget(
                              color: KThemeColors.bg_darkBlue,
                              border: KThemeBorders.border_md,
                              borderRadius: KThemeBorderRadius.borderRadius_md,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: BoxWidget(
                                  color: Colors.orange,
                                  border: KThemeBorders.border_md,
                                  borderRadius:
                                      KThemeBorderRadius.borderRadius_md,
                                  height: 300,
                                ),
                              ),
                              SizedBox(width: 16.0),
                              Expanded(
                                child: BoxWidget(
                                  color: Colors.purple,
                                  border: KThemeBorders.border_md,
                                  borderRadius:
                                      KThemeBorderRadius.borderRadius_md,
                                  height: 300,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          IntrinsicHeight(
                            child: BoxWidget(
                              color: Colors.yellow,
                              border: KThemeBorders.border_md,
                              borderRadius: KThemeBorderRadius.borderRadius_md,
                              height: 300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
