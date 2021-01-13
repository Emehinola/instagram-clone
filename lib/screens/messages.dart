import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:instagram/fetchers/getPosts.dart';
import 'package:instagram/models/posts_model.dart';
import 'package:instagram/screens/home_navigator.dart';
import 'package:instagram/widgets/heroDisplay.dart';

class MessageScreen extends StatelessWidget {
  List<Post> msgs = getPosts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        toolbarHeight: 48,
        elevation: 1.6,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print('back pressed');
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeNav()));
            }),
        title: Text(
          'Direct',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.videoOutline, size: 32, color: Colors.black54),
            onPressed: () {
              print('camera clicked');
            },
          ),
          IconButton(
            icon: Icon(MdiIcons.pencilOutline, size: 28, color: Colors.black54),
            onPressed: () {
              print('camera clicked');
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 21, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 35,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Colors.grey)),
              child: Row(children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 6),
                Text('Search',
                    style: TextStyle(fontSize: 20, color: Colors.grey))
              ]),
            ),
            SizedBox(height: 20),
            Text('Messages',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 17)),
            ListView.builder(
                shrinkWrap: true,
                itemCount: msgs.length,
                itemBuilder: (BuildContext context, int index) {
                  return SingleMessage(
                    img: msgs[index].img,
                    name: msgs[index].friend,
                    msg: 'hello dear',
                    index: index.toString(),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class SingleMessage extends StatelessWidget {
  final name, img, msg, index;

  SingleMessage({this.name, this.img, this.msg, this.index});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 70,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  child: GestureDetector(
                    onTap: () => displayHero(context, img, index),
                    child: Hero(
                      tag: index,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(img),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 13),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
                    SizedBox(height: 2),
                    Text('$msg * 2wks ago',
                        style: TextStyle(color: Colors.grey))
                  ],
                ),
              ],
            ),
            IconButton(
              icon: Icon(MdiIcons.cameraOutline, color: Colors.grey),
              onPressed: () {
                print('camera clicked');
              },
            )
          ],
        ),
      ),
    );
  }
}
