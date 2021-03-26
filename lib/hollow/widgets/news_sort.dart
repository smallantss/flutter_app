import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/hollow/data/type.dart';
import 'package:flutter_app/hollow/pages/main_screen.dart';
import 'package:flutter_app/hollow/widgets/round_container.dart';

class SortWidget extends StatefulWidget {
  SortWidget(this.type, {this.onClick});

  final SortType type;
  final Function onClick;

  @override
  State<StatefulWidget> createState() {
    return SortState();
  }
}

class SortState extends State<SortWidget> {
  SortType _type;

  onClick() {
    _type.selected = !_type.selected;
    widget.onClick();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _type = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: RoundContainer(
        color: _type.bgColor,
        radius: gap * 2,
        padding: EdgeInsets.all(gap),
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/nurse.jpeg',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: gap),
              child: Text(
                _type.tag,
                style: TextStyle(color: _type.textColor, fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
