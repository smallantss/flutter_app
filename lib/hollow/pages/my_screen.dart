import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/hollow/data/my.dart';
import 'package:flutter_app/hollow/widgets/round_container.dart';

import 'main_screen.dart';

class MyScreen extends StatelessWidget {
  final My myFans = My('我的粉丝', 0, Colors.orange);
  final My myFocus = My('我的关注', 1, Colors.blue);
  final My myCare = My('我的关心', 0, Colors.purple);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEEEEE),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            color: Colors.purple,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 60),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white, width: 2)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/head.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  '啊啊啊',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: gap),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(gap)),
                  child: Text(
                    '认识树洞已经2天',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(50))),
            child: RoundContainer(
              radius: 16,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: gap),
              padding: EdgeInsets.all(gap),
              child: Row(
                children: [
                  _myWidget(myFans),
                  VerticalDivider(
                    width: gap,
                  ),
                  _myWidget(myFocus),
                  VerticalDivider(
                    width: gap,
                  ),
                  _myWidget(myCare),
                ],
              ),
            ),
          ),
          //我的评论 我的贴子
          Container(
            padding: EdgeInsets.all(gap),
            margin: EdgeInsets.symmetric(vertical: gap),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                    child: RoundContainer(
                      color: Colors.red,
                      radius: gap,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          '我 / 的 / 评 / 论',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
                        ),
                      ),
                    )),
                VerticalDivider(
                  width: gap,
                ),
                Expanded(
                    child: RoundContainer(
                  color: Colors.orange,
                  radius: gap,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      '我 / 的 / 贴 / 子',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
                    ),
                  ),
                )),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: gap),
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:gap),
                  child: Row(
                    children: [
                      Expanded(child: Text('我的资料')),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:gap),
                  child: Row(
                    children: [
                      Expanded(child: Text('我的消息')),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:gap),
                  child: Row(
                    children: [
                      Expanded(child: Text('申请志愿者')),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static const TextStyle whiteStyle = TextStyle(color: Colors.white);

  Widget _myWidget(My my) {
    return Expanded(
        child: RoundContainer(
      color: my.bgColor,
      radius: gap,
      padding: EdgeInsets.all(gap),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            my.name,
            style: whiteStyle,
          ),
          SizedBox(
            height: gap,
          ),
          Align(
            child: Text(
              '${my.num}',
              style: whiteStyle,
            ),
            alignment: Alignment.bottomRight,
          )
        ],
      ),
    ));
  }
}

//ListView嵌套，需要知道子View的高度
//Container(
//           color: Colors.white,
//           height: 100,
//           margin: EdgeInsets.symmetric(horizontal: gap),
//           padding: EdgeInsets.all(gap),
//           child: ListView.builder(
//             shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: 3,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) => RoundContainer(
//                     color: Colors.yellow,
//                     radius: gap,
//                     padding: EdgeInsets.all(gap),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('我的粉丝'),
//                         SizedBox(
//                           height: gap,
//                         ),
//                         Align(
//                           child: Text('0'),
//                           alignment: Alignment.bottomRight,
//                         )
//                       ],
//                     ),
//                   )),
//         ),
