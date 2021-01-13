import 'package:flutter/material.dart';

void displayHero(BuildContext context, String img, String tag) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Scaffold(
              appBar: AppBar(),
              body: Hero(child: Center(child: Image.asset(img)), tag: tag))));
}
