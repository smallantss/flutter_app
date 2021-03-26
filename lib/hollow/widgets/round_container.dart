import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  final Color color;

  final double radius;

  final Widget child;

  final EdgeInsetsGeometry padding;

  final EdgeInsetsGeometry margin;

  RoundContainer(
      {this.child,
      this.color,
      this.radius = 0,
      this.padding = EdgeInsets.zero,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
    );
  }
}
