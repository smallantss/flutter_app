import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/hollow/pages/main_screen.dart';

class HotTag extends StatelessWidget {
  HotTag(this.tag, {this.color = Colors.red});

  final String tag;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: gap),
      margin: EdgeInsets.fromLTRB(0, 0, 0, gap),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(20))),
      child: Text(
        tag,
        style: TextStyle(color: color, fontSize: 8),
      ),
    );
  }
}
