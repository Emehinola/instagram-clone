import 'package:flutter/material.dart';
import 'package:instagram/widgets/circle_avatar.dart';

class BottomBar extends StatelessWidget {
  List<Icon> _icons = [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.add_box),
    Icon(Icons.favorite_border)
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text(''),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              title: Text(''),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                color: Colors.black,
              ),
              title: Text(''),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black,
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
        ]);
  }
}
