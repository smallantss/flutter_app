import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/hollow/data/hot.dart';
import 'package:flutter_app/hollow/pages/main_screen.dart';
import 'package:flutter_app/hollow/widgets/hot_tag.dart';
import 'package:flutter_app/hollow/widgets/round_container.dart';

const numStyle = TextStyle(color: Colors.white, fontSize: 6);
TextStyle numTipStyle =
    TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 6);

class HomeCard extends StatelessWidget {
  HomeCard(this.hot);

  final Hot hot;

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      margin: EdgeInsets.symmetric(vertical: gap),
      padding: EdgeInsets.all(gap),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //热门动态
          HotTag(
            hot.tag,
            color: hot.color,
          ),
          _body(hot),
        ],
      ),
      color: hot.color,
      radius: gap,
    );
  }

  Widget _body(Hot hot) {
    List<Widget> widgets = [];
    if (hot.type == 0) {
      widgets
        ..add(Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.blueAccent,
            ),
            Padding(
              padding: const EdgeInsets.only(left: gap),
              child: Text(
                hot.name,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          ],
        ))
        ..add(Padding(
          padding: const EdgeInsets.symmetric(vertical: gap),
          child: Text(
            hot.question,
            style: TextStyle(color: Colors.white),
          ),
        ))
        ..add(Row(
          children: [
            Text(
              '热度 ${hot.heat}',
              style: TextStyle(color: Colors.white, fontSize: 6),
            ),
            Padding(
              padding: const EdgeInsets.only(left: gap),
              child: Text(hot.time,
                  style: TextStyle(color: Colors.white, fontSize: 6)),
            )
          ],
        ));
    } else if (hot.type == 1) {
      widgets
        ..add(ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: hot.topics.length,
          itemBuilder: (context, index) {
            var topic = hot.topics[index];
            return Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.yellow,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gap),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        topic.title,
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(
                            topic.visit,
                            style: numStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text('访问', style: numTipStyle),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: gap),
                            child: Text(
                              topic.join,
                              style: numStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text('参与', style: numTipStyle),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: gap),
                            child: Text(
                              topic.focus,
                              style: numStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text('关注', style: numTipStyle),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Icon(
                  Icons.navigate_next,
                  color: Colors.white.withOpacity(0.4),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.white.withOpacity(0.4),
              endIndent: 20,
            );
          },
        ));
    } else {
      widgets
        ..add(Text(
          hot.question,
          style: TextStyle(
            color: Colors.white,
          ),
        ))
        ..add(Padding(
          padding: const EdgeInsets.symmetric(vertical: gap),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                hot.recommend,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Padding(
                padding: const EdgeInsets.only(left: gap),
                child: Text(
                  '推荐',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.4), fontSize: 10),
                ),
              )
            ],
          ),
        ))
        ..add(Text(
          hot.subtitle,
          style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12),
        ))
        ..add(Padding(
          padding: const EdgeInsets.only(top: gap),
          child: Row(
            children: [
              Text(
                hot.time,
                style: TextStyle(color: Colors.white, fontSize: 6),
              ),
              Padding(
                padding: const EdgeInsets.only(left: gap),
                child: Text('/  热度 ${hot.heat}',
                    style: TextStyle(color: Colors.white, fontSize: 6)),
              )
            ],
          ),
        ));
    }
    return Column(
      children: widgets,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
