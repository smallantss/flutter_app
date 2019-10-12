import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:english_words/english_words.dart';

class Study1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app title Welcome to Flutter',
      home: RandomWords(),
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
//  生成的单词集合
  final _suggestions = <WordPair>[];

//  字体
  final _bigFont = const TextStyle(fontSize: 18.0);

//  收藏的集合,判断单词是否已经进入收藏
  final _saved = Set<WordPair>();

//  /创建ListView
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (BuildContext context, int i) {
//          奇数行 添加分割线
          if (i.isOdd) {
            return Divider();
          }
//          i/2 向下取整，如i为 1 2 3 4 5，值为 0 1 1 2 2
          final index = i ~/ 2;
//          最后一个单词，则再生成个
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair wordPair) {
    final bool isSaved = _saved.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _bigFont,
      ),
      trailing: Icon(isSaved ? Icons.favorite : Icons.favorite_border,
          color: isSaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (isSaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
//    新页面的内容可以通过MaterialPageRoute 的builder创建
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final tiles = _saved.map((wordPair) {
        return ListTile(
          title: Text(
            wordPair.asPascalCase,
            style: _bigFont,
          ),
        );
      });
//      为每个tile添加1px的分割线
      final divided =
          ListTile.divideTiles(tiles: tiles, context: context).toList();
      return Scaffold(
          appBar: AppBar(
            title: Text('Save Suggestions'),
          ),
          body: ListView(children: divided));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar title Welcome to Flutter'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}
