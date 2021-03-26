import 'dart:ui';

class Hot {
  final int type;
  final String name;
  final String img;
  final String question;
  final String heat;
  final String time;
  final List<Topic> topics;
  final String recommend;
  final String subtitle;
  final Color color;

  bool get news => type == 0;

  bool get topic => type == 1;

  bool get other => type == 2;

  String get tag {
    switch (type) {
      case 0:
        return '热门动态';
      case 1:
        return '热门话题';
      default:
        return '热门推荐';
    }
  }

  Hot(this.type,
      {this.name,
      this.img,
      this.question,
      this.heat,
      this.time,
      this.topics,
      this.recommend,
      this.subtitle,
      this.color});
}

class Topic {
  final String img;
  final String title;
  final String visit;
  final String join;
  final String focus;

  Topic({this.img, this.title, this.visit, this.join, this.focus});
}
