import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/hollow/pages/game_page.dart';
import 'package:flutter_app/hollow/pages/home_page.dart';

void main() => runApp(HollowApp());

class HollowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => GamePage(),
      },
    );
  }
}
