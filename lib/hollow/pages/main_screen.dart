import 'package:flutter/material.dart';
import 'package:flutter_app/hollow/data/hot.dart';
import 'package:flutter_app/hollow/widgets/home_card.dart';
import 'file:///D:/flutter_app/lib/hollow/widgets/round_container.dart';
import 'package:flutter_app/pages/login_page.dart';

const bigTitleStyle = TextStyle(color: Colors.white, fontSize: 20);
const smallTitleStyle = TextStyle(color: Colors.white, fontSize: 14);
const gap = 8.0;
const radius8 = BorderRadius.all(Radius.circular(8));
const grayRoundRect = BoxDecoration(color: Colors.grey, borderRadius: radius8);

class MainScreen extends StatelessWidget {
  final hotNews = Hot(0,
      name: '殷天正',
      question: '好累，感觉不会再爱了',
      heat: '231',
      time: '12小时前',
      color: Colors.red);

  final hotTopics = Hot(1,
      topics: [
        Topic(
            title: '#你最想对你的前任说什么?', visit: '34600', join: '112', focus: '3511'),
        Topic(
            title: '#问问接龙|你想对后面的陌生人说些什么几把话?后面的沙雕们快来接上啊啊啊啊啊啊',
            visit: '25111',
            join: '3412',
            focus: '2535'),
        Topic(title: '#当你孤单你会想起谁?', visit: '2225', join: '462', focus: '331'),
      ],
      color: Colors.blueAccent);

  final hotRecommend = Hot(2,
      question: '为什么你总是很容易喜欢别人?',
      recommend: '大蚂蚁',
      subtitle: '更喜欢他，还是喜欢你自己?',
      heat: '1788',
      time: 'just now',
      color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          _title(),
          _content(),
        ],
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '下午好,啊啊啊',
            style: bigTitleStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: gap),
            child: Text(
              '强者之争，终有停息，弱者之战，永无休止，因为弱者从来不承认自己是弱者。',
              style: smallTitleStyle,
            ),
          )
        ],
      ),
    );
  }

  Widget _content() {
    return Container(
      padding: const EdgeInsets.all(gap),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Column(
        children: [
          _dateWidget(),
          _hotNews(hotNews),
          _hotNews(hotTopics),
          _hotNews(hotRecommend),
          // _hotTopic(),
          // _hotRecommond()
        ],
      ),
    );
  }

  Widget _hotNews(Hot hot) {
    return HomeCard(hot);
  }

  Widget _dateWidget() {
    return Row(children: [
      Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(gap / 2),
        decoration: grayRoundRect,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.4)),
              borderRadius: radius8),
          child: Column(
            children: [
              Text(
                '3月',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              Divider(
                color: Colors.white,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text('24',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              )
            ],
          ),
        ),
      ),
      Expanded(
          child: Container(
        height: 60,
        margin: EdgeInsets.only(left: gap),
        decoration: grayRoundRect,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '农历二月(大)二十',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                '辛丑年 辛某月 辛某日',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ),
      ))
    ]);
  }
}
