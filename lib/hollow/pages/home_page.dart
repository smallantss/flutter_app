import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/hollow/pages/find_screen.dart';
import 'package:flutter_app/hollow/pages/main_screen.dart';
import 'package:flutter_app/hollow/pages/my_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _mIndex = 0;

  List<Widget> _pages = List<Widget>();

  _onItemSelected(int index) {
    setState(() {
      _mIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    print('initState');
    _pages..add(MainScreen())..add(FindScreen())..add(MyScreen());
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _pages[_mIndex];
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '发现'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp), label: '我的')
        ],
        currentIndex: _mIndex,
        onTap: _onItemSelected,
      ),
    );
  }
}
