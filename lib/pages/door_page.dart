import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/data/call.dart';
import 'package:flutter_app/pages/login_page.dart';

const radius_4 = Radius.circular(4.0);
const mainColor = Color(0xFF0046C1);
const colorPrimary = Color(0xFF0089E5);

class DoorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //隐藏导航栏和状态栏
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Column(
        children: [
          //顶部信息
          TopWidget(),
          HomeWidget()
        ],
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  final callData = new List<Call>()..add(Call());

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final List<Widget> widgets = List();

  void click(bool confirm) {
    print("clickConfirm:$confirm");
    widget.callData.clear();
    setState(() {

    });
  }

  void click2(bool confirm){
    widget.callData.add(Call());
    setState(() {

    });
  }

  Widget show() {
    switch (widget.callData.length) {
      case 1:
        return SingleCallWidget(click);
      default:
        return HomeInfoWidget(click2);
    }
  }

  @override
  void initState() {
    super.initState();
    print('init State');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: show(),
      ),
    );
  }
}

class HomeInfoWidget extends StatefulWidget {

  HomeInfoWidget(this._click);

  final ValueChanged<bool> _click;

  @override
  State<StatefulWidget> createState() {
    return HomeInfoState();
  }
}

class HomeInfoState extends State<HomeInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [RoomWidget(widget._click), BedList(), InfoWidget()],
    );
  }
}

class SingleCallWidget extends StatefulWidget {
  SingleCallWidget(this._click);

  final ValueChanged<bool> _click;

  @override
  State<StatefulWidget> createState() {
    return SingleCallState();
  }
}

class SingleCallState extends State<SingleCallWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: mainColor, borderRadius: BorderRadius.circular(4.0)),
      child: Row(
        children: [
          //单个呼叫展示
          Expanded(
              child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '07',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '谢*元',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                letterSpacing: 4.0),
                          ),
                          Row(
                            children: [
                              Text(
                                '7房\r',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Text(
                                '年龄:58岁',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                          Text(
                            '正在呼叫中...',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: Image.asset(
                              'assets/icon_refuse.png',
                            ),
                            onPressed: () {
                              widget._click(false);
                            },
                            iconSize: 60,
                            padding: EdgeInsets.all(0),
                          ),
                          Text(
                            '处置',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      Divider(
                        indent: 60,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            child: InkWell(
                                onTap: () {
                                  widget._click(true);
                                },
                                child: Image(
                                    image: AssetImage(
                                  'assets/icon_confirm.png',
                                ))),
                          ),
                          Text('接听',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
          Container(
            width: 100,
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '19床',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            '正在呼叫...',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ));
                }),
          )
        ],
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  var docTitle = '责任医生';
  var docName = ['良医1', '良医2'];
  var docPic = ['assets/doc.jpeg', 'assets/doc.jpeg'];

  var nurseTitle = "责任护士";
  var nurseName = ['护士1', '护士2'];
  var nursePic = ['assets/nurse.jpeg', 'assets/nurse.jpeg'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.vertical(top: radius_4)),
            child: DoctorInfo(docTitle, docName, docPic),
          )),
          Divider(
            height: 1,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.vertical(bottom: radius_4)),
            child: DoctorInfo(nurseTitle, nurseName, nursePic),
          )),
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  static const defaultStyle = TextStyle(color: Colors.white);
  TextStyle docStyle;
  String title;
  List<String> nameList;
  List<String> picList;

  DoctorInfo(this.title, this.nameList, this.picList,
      {this.docStyle = defaultStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            title,
            style: docStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: Doctor(
                picList[0],
                name: nameList[0],
              )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4.0),
                width: 1,
                color: Colors.white,
              ),
              Expanded(
                  child: Doctor(
                picList[1],
                name: nameList[1],
              )),
            ],
          ),
        )
      ],
    );
  }
}

class Doctor extends StatelessWidget {
  static const whiteStyle = TextStyle(color: Colors.white);
  String pic;
  String name;
  TextStyle textStyle;

  Doctor(this.pic, {this.name = '', this.textStyle = whiteStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Column(
        children: [
          Expanded(
              child: Image.asset(
            pic,
            fit: BoxFit.cover,
          )),
          Text(
            name,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}

class BedList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BedListState();
  }
}

class BedListState extends State<BedList> {
  static const bedStyle =
      TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: colorPrimary, borderRadius: BorderRadius.all(radius_4)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Center(
          child: Text(
        '+1',
        style: bedStyle,
      )),
    ));
  }
}

class RoomWidget extends StatelessWidget {

  RoomWidget(this._click);

   final ValueChanged<bool> _click;

  static const roomStyle =
      TextStyle(fontSize: 70, fontWeight: FontWeight.w800, color: Colors.white);
  static const roomText =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 180,
        decoration: BoxDecoration(
            color: mainColor, borderRadius: BorderRadius.all(radius_4)),
        child: Center(
          child: GestureDetector(
            onTap: (){
              _click(true);
            },
            child: Text(
              '1',
              style: roomStyle,
            ),
          ),
        ),
      ),
      Positioned(
        left: 20.0,
        right: 20.0,
        bottom: 40.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '房',
              style: roomText,
            ),
            Text(
              '间',
              style: roomText,
            )
          ],
        ),
      )
    ]
        // child: Column(
        //   children: [
        //     Text('1',style: roomStyle,),
        //     Text('房间',style: roomText,)
        //   ],
        // ),
        );
  }
}

class TopWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TopWidgetState();
  }
}

class TopWidgetState extends State<TopWidget> {
  static const fontColor = Colors.white;

  final textStyle =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: fontColor);
  final subStyle = TextStyle(fontSize: 10, color: fontColor);
  final dateStyle =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: fontColor);
  final timeStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: fontColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [mainColor, mainColor])),
      child: Row(
        children: [
          GestureDetector(
            child: Image.asset(
              'assets/icon_logo.png',
              width: 40,
              height: 40,
            ),
            onDoubleTap: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '安徽医科大学第一附属医院',
                        style: textStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          '测试用重症医学科',
                          style: subStyle,
                        ),
                      )
                    ],
                  ),
                  Text(
                    'First Affiliated Hospital of Anhui Medical University',
                    style: textStyle,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '星期四',
                  style: dateStyle,
                ),
                Text(
                  '2021-03-17',
                  style: dateStyle,
                )
              ],
            ),
          ),
          Text(
            '13:56',
            style: timeStyle,
          )
        ],
      ),
    );
  }
}
