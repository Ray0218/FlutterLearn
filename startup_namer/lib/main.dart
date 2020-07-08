// import 'dart:js_util';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
// import 'package:flutter/semantics.dart';
// import 'package:http/http.dart';
import 'package:startup_namer/createcircle.dart';
import 'package:startup_namer/cuslistcell.dart';

import 'package:startup_namer/slRandomClor.dart';
import 'package:startup_namer/gridViewDemo.dart';
import 'package:startup_namer/rowColum.dart';

import 'package:startup_namer/expandDemo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();

    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller ando
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: new AppBar(
          title: new Text(
            'Demo',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.yellow,
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.list), onPressed: () {}),
            //   new RaisedButton(
            //     textColor: Colors.red,
            //     highlightColor: Colors.blue,
            //     onPressed: () {
            //       print('点击button');
            //     },
            //     padding: const EdgeInsets.all(0.0),
            //     child: const Text("Button", style: TextStyle(fontSize: 20)),
            //   ),
          ],
        ),
        body: new RandomWords(),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <String>[
    "testTable",
    'TestRow',
    'testIndexStack',
    'testFlow',
    'testWrip',
    'testGridView',
    'testOther',
    'testListView',
    '_testListBody',
    '_testColum',
    '创建圆角',
    'gridViewDemo',
    'expand'
  ];
  final _saved = new Set<String>();
  final TextStyle _biggerFont = new TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: Colors.lightBlue[50],
        // height: 590,
        // width: 375,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: _buildSuggestions(),
      ),

      // _buildSuggestions(),
      //     Text(
      //   "测试文本",
      //   maxLines: 1,
      //   style: TextStyle(color: Colors.blue,
      //   wordSpacing: 5,
      //   letterSpacing: 5,
      //   fontSize: 20,
      //   fontWeight: FontWeight.bold,
      //   ),
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('点击了按钮');
        },
        tooltip: "提示",
        highlightElevation: 30,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }

  TableRow createTablerow(String a, String b, String c, String d) {
    return TableRow(children: <Widget>[
      Center(child: Text(a)),
      Center(child: Text(b)),
      Center(child: Text(c)),
      Center(child: Text(d)),
    ]);
  }

  formColorList(int count) {
    var random = new Random();
    var li = <Widget>[];
    for (int i = 0; i < count; i++) {
      li.add(new Container(
        width: 100 * (random.nextDouble() + 0.3),
        height: 30,
        color: slRandomColor(),
      ));
    }
    return li;
  }

  Widget _testTable() {
    var rowsArr = <TableRow>[];
    for (int i = 0; i < 10; i++) {
      var rowitem;
      if (i == 0) {
        rowitem = createTablerow("姓名", '年龄', '称号', '测试');
      } else {
        rowitem = createTablerow(
            WordPair.random().asPascalCase,
            WordPair.random().asPascalCase,
            WordPair.random().asPascalCase,
            WordPair.random().asPascalCase);
      }

      rowsArr.add(rowitem);
    }

    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(60),
        1: FixedColumnWidth(50),
        2: FixedColumnWidth(80),
        3: FixedColumnWidth(80),
      },
      border: TableBorder.all(
        color: Colors.black,
        width: 1,
        style: BorderStyle.solid,
      ),
      // children:  <TableRow>[

      //   // TableRow(children: <Widget>[
      //   //   Center(child: Text("姓名")),
      //   //   Center(child: Text("年龄")),
      //   //   Center(child: Text("称号")),
      //   //   Center(child: Text("打的费")),
      //   // ]),
      //   // createTablerow("姓名", '年龄', '称号', '测试'),

      // ],

      children: rowsArr,
    );
  }

  
  Widget _testIndexStack() {
    return IndexedStack(
      index: 0, //显示children中的第一条
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Text("#11111111111#"),
        Text("#2222222222"),
        Text("333333333"),
      ],
    );
  }

  Widget _testFlow() {
    return Flow(
      delegate: MarginFlowDelegate(),
      children: formColorList(10),
    );
  }

  Widget _testWrip() {
    return Wrap(
      spacing: 12,
      direction: Axis.vertical,
      children: formColorList(10),
    );
  }

  Widget _testGridView() {
    return GridView.count(
        crossAxisCount: 4,
        children: List.generate(
          36,
          (index) => Card(
            child: Center(child: Text('toly $index')),
          ),
        ));
  }

  Widget _testOthers() {
    return Column(
      //  Stack(
      //   alignment: Alignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.bottomRight,
          widthFactor: 3.5,
          child: Text("测试文本第�����点多条数据"),

          //  Card(
          //   color: Colors.purple,
          //   child: Text('card文泵卡卡几号回嘎哈框'),
          //   shadowColor: Colors.red,
          // ),
        ),
        Card(
          color: Colors.yellow,
          child: Text('card文泵卡卡几号回嘎哈框'),
          shadowColor: Colors.red,
        ),
        Align(
          alignment: Alignment.topRight,
          widthFactor: 1.5,
          child: Card(
            margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
            color: Colors.purple,
            child: Text(' align card文泵卡卡几号回嘎哈框'),
            shadowColor: Colors.red,
          ),
        ),
        Offstage(
          //是否隐藏
          offstage: false,
          child: Text(
            "测试文本",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
        ),
        Transform(
            transform: Matrix4.rotationZ(3.1415 / 8),
            origin: Offset(0, 0),
            child: Card(
              margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
              color: Colors.purple,
              child: Text(' Transform card文泵卡卡几号回嘎哈框'),
              shadowColor: Colors.red,
            )),
      ],
    );
  }

  Widget _testListBody() {
    return Column(
      children: <Widget>[
        ListBody(
            mainAxis: Axis.vertical, reverse: false, children: formColorList(5))
      ],
    );

    // return row(
    //   children: <Widget>[
    //     ListBody(
    //         mainAxis: Axis.horizontal,
    //         reverse: false,
    //         children: formColorList(5))
    //   ],
    // );
  }

  // Widget _buildSuggestions() {
  //   return new ListView.builder(
  //       padding: const EdgeInsets.all(16.0),
  //       // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
  //       // 在偶数行，该函数会为单词对添加一个ListTile row.
  //       // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
  //       // 注意，在小屏幕上，分割线看起来可能比较吃力。
  //       itemBuilder: (context, i) {
  //         // 在每一列之前，添加一个1像素高的分隔线widget
  //         // if (i.isOdd) return new Divider();

  //         // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
  //         // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
  //         // final index = i ~/ 2;

  //         final index = i;

  //         // 如果是建议列表中最后一个单词对
  //         if (index >= _suggestions.length) {
  //           // ...接着再生成10个单词对，然后添���到建议列表
  //           _suggestions.addAll(generateWordPairs().take(10));
  //         }
  //         return _buildRow(_suggestions[index], i);
  //       });
  // }

  

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
      // 在偶数行，该函数会为单词对添加一个ListTile row.
      // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
      // 注意，在小屏幕上，分割线看起来可能比较吃力。
      itemBuilder: (context, i) {
        return _buildRow(_suggestions[i], i);
      },
      itemCount: _suggestions.length,
    );
  }

  Widget _buildRow(String pair, int index) {
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });

        print(pair + '$index');
        _pushNextcontrol(pair, index);
      },
    );
  }

  void _pushNextcontrol(String title, int index) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text(title),
            ),
            body: _getChild(index),
          );
        },
      ),
    );
  }

  Widget _getChild(int index) {
    switch (index) {
      case 0:
        return _testTable();
        break;

      case 1:
        return TestRow();
        break;

      case 2:
        return _testIndexStack();
        break;

      case 3:
        return _testFlow();
        break;

      case 4:
        return _testWrip();
        break;

      case 5:
        return _testGridView();
        break;

      case 6:
        return _testOthers();
        break;
      case 7:
        return TestListCell();
        break;
      case 8:
        return _testListBody();

      case 9:
        return TestColumn();

      case 10:
        return TestCircle();

      case 11:
        return GridViewBuild();
         case 12:
        return TestExpand();
      default:
        return Text('no function');
    }
  }

  void pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}

class MarginFlowDelegate extends FlowDelegate {
  EdgeInsets _margin = EdgeInsets.zero;

  @override
  void paintChildren(FlowPaintingContext context) {
    var offsetX = _margin.left;
    var offsetY = _margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + offsetX + _margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(offsetX, offsetY, 0.0));
        offsetX = w + _margin.left;
      } else {
        offsetX = _margin.left;
        offsetY +=
            context.getChildSize(i).height + _margin.top + _margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(offsetX, offsetY, 0.0));
        offsetX += context.getChildSize(i).width + _margin.left + _margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    throw UnimplementedError();
  }
}
