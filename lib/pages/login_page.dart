import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/main_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: LoginWidget()),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final phoneController = TextEditingController();
  final pwdController = TextEditingController();
  bool _loading = false;

  void login(BuildContext context) async{
    await Future.delayed(Duration(seconds: 2));
    _loading = false;
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return MainPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height -
                MediaQueryData.fromWindow(window).padding.top,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, right: 20),
                      child: Image.asset('assets/call_phone.png',
                          width: 20, height: 20),
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Text(
                    'Civa账号登录',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        color: Colors.black),
                  ),
                ),
                PhoneWidget(controller: phoneController),
                DividerLine(),
                PasswordWidget(controller: pwdController),
                DividerLine(),
                LoginButtonWidget(phoneController, pwdController,(){
                  setState(() {
                    _loading = true;
                    login(context);
                  });
                }),
                SizedBox(height: 6),
                Center(
                  child: Text(
                    '验证码登录',
                    style: TextStyle(color: Colors.orange, fontSize: 12),
                  ),
                ),
//                SizedBox(height: 200),
              ],
            ),
          ),
          Positioned(
            child: BottomTips(),
            bottom: 20,
          ),
          Align(
            child: Visibility(
              visible: _loading,
              child: Container(
                width: 100,
                height: 100,
                padding: EdgeInsets.all(35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.black38
                ),
                child: CircularProgressIndicator(backgroundColor: Colors.white,),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DividerLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.black26,
      height: 1,
      indent: 20,
      endIndent: 20,
    );
  }
}

//手机号
class PhoneWidget extends StatelessWidget {
  final TextEditingController controller;

  const PhoneWidget({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset(
            'assets/icon_phone.png',
            width: 16,
            height: 19,
          ),
        ),
        Expanded(
          child: Container(
            child: TextField(
              keyboardType: TextInputType.phone,
              cursorWidth: 1.0,
              inputFormatters: [LengthLimitingTextInputFormatter(12)],
              controller: controller,
              decoration: InputDecoration(
                  fillColor: Colors.black,
                  border: InputBorder.none,
                  hintText: '请输入手机号',
                  hintStyle: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.w100,
                      fontSize: 12)),
            ),
          ),
        )
      ],
    );
  }
}

class PasswordWidget extends StatelessWidget {
  final TextEditingController controller;

  const PasswordWidget({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset(
            'assets/icon_pwd.png',
            width: 16,
            height: 19,
          ),
        ),
        Expanded(
          child: TextField(
            cursorWidth: 1.0,
            obscureText: true,
            controller: controller,
            decoration: InputDecoration(
                hintText: '请输入密码',
                border: InputBorder.none,
                hintStyle: TextStyle(
                    color: Colors.black26,
                    fontWeight: FontWeight.w100,
                    fontSize: 12)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            '忘记密码',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12),
          ),
        )
      ],
    );
  }
}

class LoginButtonWidget extends StatefulWidget {
  final TextEditingController _phoneController;
  final TextEditingController _pwdController;
  final VoidCallback _login;

  LoginButtonWidget(this._phoneController, this._pwdController,this._login);

  @override
  _LoginButtonWidgetState createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  bool isEnable = false;
  bool isPhoneEnable = false;
  bool isPwdEnable = false;

  @override
  void initState() {
    widget._phoneController.addListener(() {
      isPhoneEnable = widget._phoneController.text.length > 10;
      setState(() {
        isEnable = isPhoneEnable && isPwdEnable;
      });
    });
    widget._pwdController.addListener(() {
      isPwdEnable = widget._pwdController.text.isNotEmpty;
      setState(() {
        isEnable = isPhoneEnable && isPwdEnable;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: RaisedButton(
        disabledColor: Colors.black54,
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: isEnable ? widget._login : null,
        padding: EdgeInsets.all(0),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: isEnable
                  ? LinearGradient(colors: [Colors.yellow, Colors.deepOrange])
                  : null),
          child: Center(
            child: Text(
              '登录',
            ),
          ),
        ),
      ),
    );
  }
}

class BottomTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
            text: '登录代表您已阅读并同意',
            style: TextStyle(fontSize: 10, color: Colors.black38),
            children: [
              TextSpan(
                  text: '用户协议',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('用户协议');
                    }),
              TextSpan(
                  text: '和',
                  style: TextStyle(fontSize: 10, color: Colors.black38)),
              TextSpan(
                  text: '隐私政策',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('隐私政策');
                    })
            ]),
      ),
    );
  }
}
