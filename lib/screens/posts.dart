import 'package:flutter/material.dart';
import 'package:instagram/fetchers/getStatus.dart';
import 'package:instagram/models/status.dart';
import 'package:instagram/widgets/profile_avatar.dart';
import 'package:instagram/models/posts_model.dart';
import 'package:instagram/fetchers/getPosts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainHome extends StatelessWidget {
  List<Status> allStatus = getUserStatus(); // list of the users status

  LinearGradient colorGradient = LinearGradient(
      colors: [Colors.yellow, Colors.purple],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);

  // getting all posts
  List<Post> posts = getPosts();

  @override
  Widget build(BuildContext contex) {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                height: 126,
                color: Colors.grey[190],
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: allStatus.length,
                    itemBuilder: (BuildContext context, int index) {
                      return index == 0
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ProfileAvatar(85.0),
                                Text('Your Story',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500))
                              ],
                            )
                          : Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: colorGradient,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.white, width: 2.0)),
                                      child: StatusAvatar(
                                        img: allStatus[index].img,
                                        name: allStatus[index].name,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('${allStatus[index].name}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            );
                    })),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostSection(
                    name: posts[index].friend,
                    img: posts[index].img,
                    likes: posts[index].likes,
                    write_up: posts[index].write_up,
                  );
                })
          ],
        )
      ],
    );
  }
}

class PostSection extends StatelessWidget {
  final name, img, likes, write_up;
  PostSection({this.name, this.img, this.likes, this.write_up});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage(img)),
            title: Text(name, style: TextStyle(fontWeight: FontWeight.w800)),
            subtitle: Text('Sponsored'),
            trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  print('more pressed');
                }),
          ),
        ),
        Image.asset(img),
        Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 30,
                          color: Colors.red,
                        ),
                        SizedBox(width: 8),
                        Icon(MdiIcons.chatOutline,
                            size: 30, color: Colors.grey[700]),
                        SizedBox(width: 8),
                        Icon(Icons.send, size: 27, color: Colors.grey[700])
                      ],
                    ),
                    Icon(MdiIcons.homeAnalytics,
                        size: 30, color: Colors.grey[700])
                  ],
                ),
                SizedBox(height: 6),
                Row(children: [
                  Text('$likes'),
                  SizedBox(width: 5),
                  Text('Likes', style: TextStyle(fontWeight: FontWeight.w800)),
                ]),
                SizedBox(height: 5),
                Text.rich(TextSpan(text: '', children: [
                  TextSpan(
                      text: '#$name ',
                      style: TextStyle(fontWeight: FontWeight.w800)),
                  TextSpan(text: '$write_up'),
                  TextSpan(
                    text: '...more',
                    style: TextStyle(color: Colors.grey),
                  )
                ]))
              ],
            )),
        Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(img),
                  ),
                  SizedBox(width: 7),
                  Text('Add a comment...',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.favorite, color: Colors.red, size: 18),
                  Icon(MdiIcons.hand, color: Colors.yellow, size: 18),
                  Icon(Icons.add_circle_outline, color: Colors.grey, size: 18),
                ],
              )
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 10, top: 3),
            child: Text('4 days ago', style: TextStyle(color: Colors.grey))),
        SizedBox(height: 20),
      ],
    );
  }
}
