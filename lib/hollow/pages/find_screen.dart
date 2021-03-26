import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/hollow/data/news.dart';
import 'package:flutter_app/hollow/data/type.dart';
import 'package:flutter_app/hollow/pages/main_screen.dart';
import 'package:flutter_app/hollow/widgets/hot_tag.dart';
import 'package:flutter_app/hollow/widgets/news.dart';
import 'package:flutter_app/hollow/widgets/news_sort.dart';
import 'package:flutter_app/hollow/widgets/round_container.dart';

class FindScreen extends StatelessWidget {
  final List<SortType> sortList = [
    SortType(0,
        tag: '全部',
        normalBgColor: Colors.white,
        selectBgColor: Colors.red,
        normalTextColor: Colors.red,
        selectTextColor: Colors.white,
        selected: false),
    SortType(1,
        tag: '文字',
        normalBgColor: Colors.white,
        selectBgColor: Colors.blue,
        normalTextColor: Colors.blue,
        selectTextColor: Colors.white,
        selected: false),
    SortType(2,
        tag: '图片',
        normalBgColor: Colors.white,
        selectBgColor: Colors.green,
        normalTextColor: Colors.green,
        selectTextColor: Colors.white,
        selected: false),
    SortType(3,
        tag: '视频',
        normalBgColor: Colors.white,
        selectBgColor: Colors.yellow,
        normalTextColor: Colors.yellow,
        selectTextColor: Colors.white,
        selected: false)
  ];

  final List<News> newsList = List();

  @override
  Widget build(BuildContext context) {
    newsList.add(News(name: '全部动态'));
    for (int i = 0; i < 10; i++) {
      newsList.add(News(
          name: '白无常', level: '等级$i', way: '手机发布', time: '$i小时前', num: i * 23));
    }
    return Container(
      color: Colors.white,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          //搜索
          _search(),
          //背景色
          Container(
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
            child: Column(
              children: [
                //分类
                _sort(),
                //列表背景
                Container(
                  padding: EdgeInsets.all(gap),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16))),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: newsList.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Text(
                            newsList[index].name,
                            style: TextStyle(color: Colors.black87),
                          );
                        } else {
                          return NewsWidget(news: newsList[index]);
                        }
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _sort() {
    return RoundContainer(
      radius: gap * 2,
      padding: EdgeInsets.all(gap),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HotTag(
            '动态分类',
            color: Colors.purple,
          ),
          _typeList(sortList),
        ],
      ),
    );
  }

  Widget _typeList(List<SortType> typeList) {
    return Row(
      children: typeList
          .map((sort) => Expanded(
                  child: SortWidget(
                sort,
                onClick: () {
                  print(sort.tag);
                },
              )))
          .toList(),
    );
  }

  Widget _search() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: gap),
            decoration: BoxDecoration(
              color: Color(0xffeeeeee),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search_rounded,
                  color: Color(0xffcccccc),
                  size: 20,
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                      hintText: '请输入内容关键词',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(left: gap),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2, spreadRadius: 1, color: Colors.purple)
                    ]),
                child: Text(
                  '搜索',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
