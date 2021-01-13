import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/widgets/home_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram/screens/profile.dart';
import 'package:instagram/widgets/circle_avatar.dart';
import 'package:instagram/screens/posts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex;
  bool displayAppBar = true;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _currentIndex = 0;
    super.initState();
  }

  List<Widget> pages = [
    MainHome(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    ProfilePage()
  ];

  void getTab(int index) {
    setState(() {
      _currentIndex = index;
      displayAppBar = _currentIndex == 4 ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: displayAppBar
            ? PreferredSize(
                preferredSize: Size(size.width, 49),
                child: SafeArea(child: Bar()))
            : PreferredSize(
                preferredSize: Size(double.infinity, kToolbarHeight),
                child: SafeArea(
                  top: true,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text(
                            'sammy.code',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Icon(Icons.arrow_drop_down)
                        ]),
                        IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              print('menu pressed');
                            }),
                      ],
                    ),
                  ),
                ),
              ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            unselectedItemColor: Colors.black87,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedItemColor: Colors.black,
            onTap: getTab,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            iconSize: 33,
            elevation: 10.0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    _currentIndex == 0 ? Icons.home : MdiIcons.homeOutline,
                  ),
                  title: Text(''),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 35),
                  title: Text(''),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(
                    MdiIcons.plusBoxOutline,
                  ),
                  title: Text(''),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  title: Text(''),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Avatar(
                    height: 30.0,
                    width: 30.0,
                  ),
                  title: Text(''),
                  backgroundColor: Colors.white),
            ]));
  }
}
