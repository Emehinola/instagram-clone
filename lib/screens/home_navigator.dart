import 'package:flutter/material.dart';
import 'package:instagram/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:instagram/screens/messages.dart';

class HomeNav extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeNav> with SingleTickerProviderStateMixin {
  List<Widget> list_of_screens = [Home(), MessageScreen()];
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.grey[300],
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));

    return Scaffold(
      body: PageView(
          allowImplicitScrolling: true,
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: list_of_screens),
    );
  }
}
