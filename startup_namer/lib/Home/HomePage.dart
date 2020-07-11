import 'dart:math';

import 'package:flutter/material.dart';
import 'package:startup_namer/home/wripDemo.dart';
import 'package:startup_namer/home/stackDemo.dart';
import 'package:startup_namer/home/rowColum.dart';
import 'package:startup_namer/home/gridViewDemo.dart';
import 'package:startup_namer/home/expandDemo.dart';
import 'package:startup_namer/home/cardDemo.dart';
import 'package:startup_namer/home/createcircle.dart';
import 'package:startup_namer/home/cuslistcell.dart';
import 'package:startup_namer/slRandomClor.dart';
import 'package:english_words/english_words.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    'expand',
    'stackDemo',
    'card and AspectRatio',
    'TestCardDemo'
  ];

  final _saved = new Set<String>();
  final TextStyle _biggerFont = new TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: DrawerHeader(
                  child: Text('ddd'),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2816775233,230540815&fm=26&gp=0.jpg'),
                          fit: BoxFit.cover)),
                ))
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text('我的空间'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.supervised_user_circle,
                  color: slRandomColor(),
                ),
              ),
              title: Text('用户中心'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/userCenter');
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text('设置中心'),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: UserAccountsDrawerHeader(
                  accountName: Text('用户昵称'),
                  accountEmail: Text('123@163.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2905678561,227122043&fm=26&gp=0.jpg'),
                  ),
                  otherAccountsPictures: <Widget>[
                    Image.network(
                        'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1093983655,449926666&fm=111&gp=0.jpg'),
                    Image.network(
                        'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=10190708,1439802928&fm=111&gp=0.jpg')
                  ],
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2816775233,230540815&fm=26&gp=0.jpg'),
                          fit: BoxFit.cover)),
                )),
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text('我的空间'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.supervised_user_circle,
                  color: slRandomColor(),
                ),
              ),
              title: Text('用户中心'),
              onTap: () => Navigator.of(context).pushNamed('/userCenter'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text('设置中心'),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.lightBlue[50],
        // height: 590,
        // width: 375,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: _buildSuggestions(),
      ),

 
      // floatingActionButton只能显示一个,多个会照成跳转问题
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.purple,
      //   onPressed: () {
      //     print('点击了按钮');

      //     Navigator.pushNamed(context, '/search');
      //   },
      //   tooltip: "提示",
      //   highlightElevation: 30,
      //   child: Icon(
      //     Icons.pages,
      //     color: Colors.orange,
      //     size: 40,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
            "测试文���",
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

    
  }

 

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      // 对于每���建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
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
            body:  _getChild(index),
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
        return WirpDemo();
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

      case 13:
        return TestStack();
      case 14:
        return TestCard();
      case 15:
        return TestCardDemo();
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
