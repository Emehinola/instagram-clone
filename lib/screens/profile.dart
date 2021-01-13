import 'package:flutter/material.dart';
import 'package:instagram/widgets/profile_avatar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfilePage extends StatefulWidget {
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(height: 100, width: 100, child: ProfileAvatar(100.0)),
            Column(children: [
              Text('3',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              Text('Posts',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ]),
            Column(children: [
              Text('4.5m',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              Text('Followers',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ]),
            Column(children: [
              Text('33',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              Text('Following',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ])
          ])),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Emehinola Samuel',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              Text(
                  'A computer science of the University of Lagos, Akoka, Nigeria.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54)),
              Text('#webdeveloper #pythonprogrammer #mathematician',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
            ],
          )),
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300], width: 1.5),
            borderRadius: BorderRadius.circular(3.0)),
        margin: EdgeInsets.all(13.0),
        padding: EdgeInsets.symmetric(vertical: 7.0),
        child: Center(
            child: Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
        )),
      ),
      SizedBox(height: 10.0),
      Divider(
        height: 2.0,
        color: Colors.grey,
      ),
      TabBarMini()
    ])));
  }
}

// creating tab bar here
class TabBarMini extends StatefulWidget {
  @override
  _TabBarMiniState createState() => _TabBarMiniState();
}

class _TabBarMiniState extends State<TabBarMini>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  Widget imageRow(double _screenWidth) {
    return Row(
      children: [
        Container(
            height: 150,
            width: (_screenWidth / 3) - 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/1.jpg'), fit: BoxFit.cover),
            )),
        Container(
            height: 150,
            width: _screenWidth / 3,
            margin: EdgeInsets.symmetric(horizontal: 2.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/2.jpg'), fit: BoxFit.cover),
            )),
        Container(
            height: 150,
            width: (_screenWidth / 3) - 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/3.jpg'), fit: BoxFit.cover),
            ))
      ],
    );
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    List<Widget> _children = [
      Container(
        child: imageRow(_screenWidth),
      ),
      Container(color: Colors.green)
    ];

    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5.0),
            child: TabBar(
              labelPadding: EdgeInsets.symmetric(vertical: 10.0),
              indicatorColor: Colors.black,
              controller: _tabController,
              tabs: [
                Icon(Icons.border_horizontal, size: 35),
                Icon(
                  Icons.person_outline,
                  size: 35,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3.0),
            height: 150,
            child: TabBarView(
              children: _children,
              controller: _tabController,
            ),
          )
        ],
      ),
    );
  }
}
