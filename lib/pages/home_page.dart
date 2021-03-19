import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/anim/SlideRightRoute.dart';
import 'package:flutter_app/pages/head_page.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:flutter_app/pages/main_page.dart';
import 'package:flutter_app/pages/setting_page.dart';

import 'door_page.dart';

class ListenSpeakApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //跳转页面通过设置initialRoute为主页面，不能同时设置home，会冲突
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashWidget(),
        '/login': (context) => LoginPage(),
        '/main': (context) => MainPage(),
        '/head': (context) => HeadPage(),
        '/door': (context) => DoorPage(),
        '/setting': (context) => SettingPage(),
      },
    );
  }
}

class SplashWidget extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashWidget> with TickerProviderStateMixin {
  AnimationController controller;

  //动画类型 曲线 插值
  CurvedAnimation curvedAnimation;
  BuildContext _context;

  @override
  void initState() {
    print('initState');
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.linear)
      ..addListener(_getAnimListener)
      ..addStatusListener(_animStatusListener);
    //开启动画
    controller.forward();
  }

  _next(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    _goToNextPage();
  }

  //此时的流程  forward -> completed -> revese -> dismissed
  void _animStatusListener(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.forward:
        print('status-> forward');
        break;
      case AnimationStatus.completed:
        print('status-> completed');
//        controller.reverse();
        _next(context);
        break;
      case AnimationStatus.reverse:
        print('status-> revese');
        break;
      case AnimationStatus.dismissed:
        print('status-> dismissed');
//        _next(context);
        break;
    }
  }

  void _getAnimListener() {
    //这两个值都可以获取到动画的值
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return _getSplashWidget2();
  }

  //跳转到相应页面
  _goToNextPage() {
    bool isLogin = true;
    if (isLogin) {
      //第一种通过类名，第二种通过'/login'命名路由
//      Navigator.pop(context);
//      Navigator.push(
//          _context, MaterialPageRoute(builder: (context) => LoginPage()));
      Navigator.pushAndRemoveUntil(
          _context,
          FadeRoute(page: DoorPage()),
//          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => route == null);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          _context, '/login', (route) => route == null);
    }
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  //FadeTransition不需要setState
  _getSplashWidget() {
    return Container(
      //防止从0-1背景是黑色
      color: Colors.white,
      child: FadeTransition(
          opacity: curvedAnimation,
          child: Image.asset('assets/bg_launcher.png')),
    );
  }

  _getSplashWidget2() {
    return Container(
      color: Colors.white,
      child: Opacity(
        opacity: controller.value,
        child: Image.asset('assets/bg_launcher.png'),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    curvedAnimation.removeListener(_getAnimListener);
  }
}
