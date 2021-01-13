import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  Avatar({this.height, this.width});

  final height;
  final width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/vic.jpg'),
      ),
    );
  }
}
