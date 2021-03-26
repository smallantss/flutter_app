import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/hollow/data/news.dart';
import 'package:flutter_app/hollow/pages/main_screen.dart';

class NewsWidget extends StatelessWidget {
  final News news;

  const NewsWidget({this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //头部信息
          Padding(
            padding: const EdgeInsets.symmetric(vertical: gap),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(gap),
                  child: Image.asset(
                    'assets/head.jpg',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: gap),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.name,
                        style: TextStyle(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: gap),
                        child: Text(
                          news.level,
                          style: TextStyle(color: Colors.black87, fontSize: 10),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Text(
            '爱国郎平哈珀结构加固了就赶紧跑法国国家觉得赶紧安排跟进结果，，噶【将更加昂贵骄傲宫颈癌感觉你【话客【和吉特结果i韩国军方高级吧',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          //阅读信息
          Padding(
            padding: const EdgeInsets.symmetric(vertical: gap),
            child: Row(
              children: [
                Text(
                  news.way,
                  style: TextStyle(color: Colors.green, fontSize: 10),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: gap),
                  child: Text(
                    '· ' + news.time,
                    style: TextStyle(color: Colors.black87, fontSize: 10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: gap),
                  child: Text(
                    '· ${news.num} 阅读',
                    style: TextStyle(color: Colors.black87, fontSize: 10),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey.withOpacity(0.4),
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: gap),
            child: Row(
              children: [
                Expanded(child: Icon(Icons.favorite)),
                Expanded(child: Icon(Icons.messenger_rounded)),
                Expanded(child: Icon(Icons.share)),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.withOpacity(0.2),
            height: 10,
            thickness: 10,
          ),
        ],
      ),
    );
  }
}
