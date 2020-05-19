import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Model {
  final String hotel;
  final String flight;
  final String travel;

  Model({this.hotel, this.flight, this.travel});
}

class Item {}

class GridNav extends StatelessWidget {
  final Model model;

  const GridNav({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _gridNavItems(context),
    );
  }

  _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (model == null) {
      return items;
    }
    if (model.hotel != null) {}
    if (model.flight != null) {}
    if (model.travel != null) {}
    return items;
  }

  _gridNavItem(BuildContext context, Item item, bool first) {
    List<Widget> items = [];
    items.add(_mainItem(context, model));
  }

  _mainItem(BuildContext context, Model model) {
    return GestureDetector(
      onTap: () {
        //点击跳转33333333333333
        Navigator.of(context).push(MaterialPageRoute());
      },
      child: Stack(
        children: <Widget>[
          Image.network(
            '',
            height: 88,
            width: 121,
            fit: BoxFit.contain,
            alignment: AlignmentDirectional.bottomEnd,
          ),
          Text(
            'Title',
            style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
          )
        ],
      ),
    );
  }
}
