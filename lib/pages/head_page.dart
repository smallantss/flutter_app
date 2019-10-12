
import 'package:flutter/material.dart';

class HeadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HeadWidget()),
    );
  }
}

class HeadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset('assets/icon_left_black.png',width: 9,height: 15,),
      ],
    );
  }
}

