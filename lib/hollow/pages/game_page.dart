import 'dart:async';

import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  final _controller = StreamController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder(
            stream: _controller.stream,
            builder: (context, snapShot) => Text(snapShot.data.toString() ?? 'waiting')),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            child: GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              childAspectRatio: 2/1,
              crossAxisCount: 3,
              children: List.generate(
                  9,
                  (index) => FlatButton(
                    shape: RoundedRectangleBorder(),
                    color: Colors.red,
                        onPressed: () {
                          _controller.sink.add(index + 1);
                        },
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(fontSize: 24,color: Colors.white),
                        ),
                      )),
            ),
          ),
        ),
      ],
    );
  }
}
