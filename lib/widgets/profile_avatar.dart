import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  double size;

  ProfileAvatar(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Stack(
        children: [
          Container(
              height: size,
              width: size,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/vic.jpg'),
              )),
          Positioned(
              right: 2,
              bottom: -1,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    border: Border.all(width: 1, color: Colors.white)),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 15,
                ),
              ))
        ],
      ),
    );
  }
}

class StatusAvatar extends StatelessWidget {
  String name;
  String img;

  StatusAvatar({this.name, this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: CircleAvatar(backgroundImage: AssetImage(img)),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
    );
  }
}
