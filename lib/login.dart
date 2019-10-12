import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//  用来控制TextField
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Container(child: SizedBox(height: 80.0)),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('SHRINE'),
              ],
            ),
            Container(child: SizedBox(height: 120.0)),
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(
//                代表背景色被浅色填充
                filled: true,
                labelText: 'UserName',
              ),
            ),
//            用来占位的
            SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
//            隐藏文字为....
              obscureText: true,
            ),
//            用来放一行的按钮，默认重心在end，用于Dialog
            ButtonBar(
              children: <Widget>[
                FlatButton(onPressed: () {
                  _userNameController.clear();
                  _passwordController.clear();
                }, child: Text('CANCEL')),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("NEXT"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
