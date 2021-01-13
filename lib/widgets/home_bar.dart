import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      padding: EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            IconButton(
                icon: Icon(MdiIcons.cameraOutline,
                    size: 30, color: Colors.grey[800]),
                onPressed: () {
                  print('camera pressed');
                }),
            Text('Instagram',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'LobsterTwo-Italic',
                    fontStyle: FontStyle.normal))
          ]),
          IconButton(
              icon: Icon(
                MdiIcons.sendOutline,
                size: 30,
                color: Colors.grey[800],
              ),
              onPressed: () {
                print('messages');
              })
        ],
      ),
    );
  }
}
