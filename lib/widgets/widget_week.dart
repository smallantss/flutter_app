import 'dart:math';

import 'package:flutter/material.dart';

///AnimatedBuilder 给组件添加动画
class AnimBuilderWidget extends StatefulWidget {
  @override
  _AnimBuilderWidgetState createState() => _AnimBuilderWidgetState();
}

class _AnimBuilderWidgetState extends State<AnimBuilderWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: 0, end: 2 * pi).animate(controller);
    return AnimatedBuilder(
        animation: animation,
        child: FlutterLogo(),
        builder: (context, child) {
          return Transform.rotate(
            angle: animation.value,
            child: child,
          );
        });
  }
}

///滑动删除组件
class DismissWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: null,
      child: null,
      ///滑动的背景
      background: null,
      ///双向滑动的背景
      secondaryBackground: null,
      ///可以用来判断方向
      onDismissed: (direction) {

      },
    );
  }
}
