import 'dart:ui';

import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: MainWidget()),
    );
  }
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
//        height: MediaQuery.of(context).size.height -
//            MediaQueryData.fromWindow(window).padding.top,
        child: Column(
          children: <Widget>[
            _getWeekWidget(context),
            _getTaskWidget(false),
            _getPreTask(),
          ],
        ),
      ),
    );
  }

  Widget _getWeekWidget(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Text(
            '本周任务',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context,'/head');
            },
            child: Image.asset(
              'assets/icon_head.png',
              width: 30,
              height: 30,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getTaskWidget(bool haveTask) {
    if (haveTask) {
      return Container();
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 220,
              height: 220,
              child: Image.asset('assets/task_empty.png')),
          Text(
            '老师暂时还没有布置任务哦',
            style: TextStyle(color: Colors.black26, fontSize: 12),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.orange)),
            child: Text(
              '自主学习',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 14,
                  fontWeight: FontWeight.w100),
            ),
          )
        ],
      );
    }
  }

  Widget _getPreTask() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                '往期任务',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                '全部',
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 10, 20, 0),
              child: Image.asset(
                'assets/home_arrow_down.png',
                width: 8,
                height: 5,
              ),
            )
          ],
        ),
        _getPreTaskList(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            '我也是有底线的~',
            style: TextStyle(color: Colors.black26, fontSize: 10),
          ),
        )
      ],
    );
  }

  Widget _getPreTaskList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  //Row是行，因此这个是列对齐方法，start为列开始对齐
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/home_temp_bg.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        //为列
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'The pencil is blue',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            'EEC4 Unit4 PartA',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black26,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                )
              ],
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.orange)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Text(
                    '开始学习',
                    style: TextStyle(color: Colors.orange, fontSize: 8),
                  ),
                ),
              ),
            )
          ],
        );
      },
      itemCount: 10,
      //嵌套滚动解决，不让自己滚动
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
