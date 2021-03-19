import 'dart:math';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
void main() {
  runApp(ListenSpeakApp());
}

//AnimatedContainer可以使用动画修改圆角背景色等11111111111111111
class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 50;
  double _height = 100;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            width: _width,
            height: _height,
            decoration:
                BoxDecoration(color: _color, borderRadius: _borderRadius),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(50) + 50.toDouble();
            _height = random.nextInt(50) + 100.toDouble();
            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), 1);
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        }),
      ),
    );
  }
}

//使用AnimatedOpacity修改透明度
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnimatedOpacity(
          child: Container(
            width: 100,
            height: 200,
            color: Colors.green,
          ),
          duration: Duration(seconds: 2),
          opacity: _visible ? 1.0 : 0.0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _visible = !_visible;
            });
          },
          child: Icon(Icons.flip),
        ),
      ),
    );
  }
}

//添加一个Drawer
class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDrawer(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Item1'),
              onTap: () {
                print(111);
                //点击关闭Drawer
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Item2'),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}

//显示SnackBars
class SnackBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar'),
        ),
        body: SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  //1.创建一个SnackBar
  final SnackBar snackBar = SnackBar(
    content: Text('This is a SnackBar'),
    action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          print('undo');
        }),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Center(
        widthFactor: 10,
        heightFactor: 2.0,
        child: Container(color: Colors.red, child: Text('Center')),
      ),
    );
  }
}

class TabApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
              )
            ]),
          ),
          body: TabBarView(children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ]),
        ),
      ),
    );
  }
}

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form'),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  //一般情况下，推荐使用 GlobalKey 来访问一个表单。嵌套组件且组件树比较复杂的情况下，可以使用 Form.of() 方法访问表单。
  //这个表单的唯一标志
  final _formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    controller.addListener(_textChange);
  }

  _textChange() {
    print('input->${controller.text}');
  }

  @override
  void dispose() {
    _focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: null,
              focusNode: _focusNode,
              //验证的逻辑
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter text';
                }
                return null;
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text('${controller.text}'),
                        );
                      });
                },
                child: Text('Submit'),
              ),
            ),
            TextField(
              controller: controller,
              onChanged: (value) {
                print('输入的->$value');
              },
            )
          ],
        ));
  }
}
