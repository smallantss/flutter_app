import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {

  final TextEditingController _pwsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _pwsController.text = '080900';
    _pwsController.selection = TextSelection(
        baseOffset: _pwsController.text.length,
        extentOffset: _pwsController.text.length);
    return Material(
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/icon_back.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 80),
            child: Center(
              child: Text(
                '请输入管理员密码',
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 150),
            child: TextField(
              controller: _pwsController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.blue, fontSize: 20),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '请输入管理员密码',
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 4),
                  hintStyle: TextStyle(
                      color: Colors.blue.withOpacity(0.5),
                      fontWeight: FontWeight.w100,
                      fontSize: 20)),
            ),
          ),
          Center(
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
              textColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Text(
                '确定',
                style: TextStyle(fontSize: 20, letterSpacing: 4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
