import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  void _search() {
    print(1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Wan Android',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('首页'),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: _search,
              tooltip: 'search',
            )
          ],
        ),
        body: Expanded(
            child: Column(
          children: <Widget>[],
        )),
      ),
    );
  }
}

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BodyWidget();
  }
}

class BodyWidget extends StatefulWidget {
  //代表是那种类型  0 首页 1 体系 2 公众号 3 项目 4 我的
  final int type;

  BodyWidget({Key key, this.type}) : super(key: key);

  @override
  _BodyState createState() {
    return _BodyState();
  }
}

class _BodyState extends State<BodyWidget> {
  @override
  void initState() {
    super.initState();
  }

  String _getText(int tag) {
    switch (tag) {
      case 0:
        return "首页";
      case 1:
        return "体系";
      case 2:
        return "公众号";
      case 3:
        return "项目";
      default:
        return "我的";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(_getText(widget.type)),
        ),
        BottomWidget()
      ],
    );
  }
}

class BottomWidget extends StatefulWidget {
  final bottomList = new List<BottomBean>(5)
    ..add(BottomBean("首页", Icon(Icons.home)))
    ..add(BottomBean("体系", Icon(Icons.book)))
    ..add(BottomBean("公众号", Icon(Icons.message)))
    ..add(BottomBean("项目", Icon(Icons.pages)))
    ..add(BottomBean("我的", Icon(Icons.my_location)));

  final VoidCallback callback;

  BottomWidget({Key key, this.callback}) : super(key: key);

  @override
  _BottomState createState() {
    return _BottomState();
  }
}

class _BottomState extends State<BottomWidget> {
  _changeBottom(String text) {
    print(text);
//    widget.callback(text);
  }

  List<Widget> _getBottom() {
    var widgets = const <Widget>[];
    widget.bottomList.forEach((e) {
      widgets.add(GestureDetector(
        onTap: _changeBottom(e.text),
        child: Column(
          children: <Widget>[e.icon, Text(e.text)],
        ),
      ));
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _getBottom(),
    );
  }
}

class BottomBean {
  final String text;
  final Icon icon;

  BottomBean(this.text, this.icon);
}
