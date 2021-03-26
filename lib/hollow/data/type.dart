import 'dart:ui';

import 'package:flutter/material.dart';

class SortType {
  SortType(this.type,
      {this.tag,
      this.selected = false,
      this.normalTextColor = Colors.red,
      this.selectTextColor = Colors.white,
      this.normalBgColor = Colors.white,
      this.selectBgColor = Colors.blue,
      this.img});

  final int type;
  final String tag;
  final Color normalTextColor;
  final Color selectTextColor;
  final Color normalBgColor;
  final Color selectBgColor;
  final String img;
  bool selected;

  Color get bgColor => selected ? selectBgColor : normalBgColor;

  Color get textColor =>selected ? selectTextColor : normalTextColor;
}
