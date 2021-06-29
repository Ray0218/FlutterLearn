import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:startup_namer/Home/Sliverdemo.dart';
import 'package:startup_namer/Home/dataTableDemo.dart';
import 'package:startup_namer/Home/dragableScrolTablesheet.dart';
import 'package:startup_namer/Home/flowDemo.dart';
import 'package:startup_namer/Home/needScrollViewDemo.dart';
import 'package:startup_namer/home/wripDemo.dart';
import 'package:startup_namer/home/stackDemo.dart';
import 'package:startup_namer/home/gridViewDemo.dart';
import 'package:startup_namer/home/expandDemo.dart';
import 'package:startup_namer/home/cardDemo.dart';
import 'package:startup_namer/home/createcircle.dart';
import 'package:startup_namer/home/cuslistcell.dart';
import 'package:startup_namer/slRandomClor.dart';
import 'package:english_words/english_words.dart';

import 'CupertinoFormSection.dart';
import 'nativeIosView.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _suggestions = <String>[
    "testTable",
    'CupertinoFormSection',
    'testContainer',
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
    'TestCard and FadeImage',
    'autocomplete',
    'KLNativeViewDemo',
    'KLSliverDemo',
    'KLDAtaColumn',
    'DraggableScrollableSheet',
    'NeedScrollPage'
  ];

  final _saved = new Set<String>();
  final TextStyle _biggerFont = new TextStyle(fontSize: 18.0);

  ScrollController _scrComtroller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("HomePage 重绘了 ");
    return new Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                size: 20,
              ),
              onPressed: () {
                _showSearchWiget(context);
              })
        ],
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
      // endDrawer: Drawer(
      //   child: Column(
      //     children: <Widget>[
      //       Row(
      //         children: <Widget>[
      //           Expanded(
      //               child: UserAccountsDrawerHeader(
      //             accountName: Text('用户昵称'),
      //             accountEmail: Text('123@163.com'),
      //             currentAccountPicture: CircleAvatar(
      //               backgroundImage: NetworkImage(
      //                   'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2905678561,227122043&fm=26&gp=0.jpg'),
      //             ),
      //             otherAccountsPictures: <Widget>[
      //               Image.network(
      //                   'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1093983655,449926666&fm=111&gp=0.jpg'),
      //               Image.network(
      //                   'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=10190708,1439802928&fm=111&gp=0.jpg')
      //             ],
      //             decoration: BoxDecoration(
      //                 image: DecorationImage(
      //                     image: NetworkImage(
      //                         'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2816775233,230540815&fm=26&gp=0.jpg'),
      //                     fit: BoxFit.cover)),
      //           )),
      //         ],
      //       ),
      //       ListTile(
      //         leading: CircleAvatar(
      //           child: Icon(Icons.home),
      //         ),
      //         title: Text('我的空间'),
      //       ),
      //       Divider(),
      //       ListTile(
      //         leading: CircleAvatar(
      //           child: Icon(
      //             Icons.supervised_user_circle,
      //             color: slRandomColor(),
      //           ),
      //         ),
      //         title: Text('用户中心'),
      //         onTap: () => Navigator.of(context).pushNamed('/userCenter'),
      //       ),
      //       Divider(),
      //       ListTile(
      //         leading: CircleAvatar(
      //           child: Icon(Icons.settings),
      //         ),
      //         title: Text('设置中心'),
      //       ),
      //     ],
      //   ),
      // ),
      body: Container(
        color: Colors.lightBlue[50],
        // height: 590,
        // width: 375,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Stack(
          children: [


           Container(

             height: 200,
             width: 200,
             child:  GridPaper(
color: Colors.red,

divisions: 2, //参数表示每个主网格的分割数。
subdivisions:1,//参数表示次网格的分割数，包含它自身。

             )
             ,
           ),
            ScrollConfiguration(
              child: _buildSuggestions(),
              behavior: MyScrollBehavior(),
            ),
            Positioned(
                child: ElevatedButton(
              child: Text('回到最低部'),
              onPressed: () {
                _scrComtroller.jumpTo(_scrComtroller.position.maxScrollExtent);
              },
            ))
          ],
        ),
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

  _showSearchWiget(BuildContext context) {
    showSearch(context: context, delegate: CustomeSearchDelegate());
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

  Widget _testContainer() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 200,
        height: 200,
        //  color: Colors.orange,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.orange]),
            // color: Colors.blue,
            image: DecorationImage(
                image: NetworkImage("https://picsum.photos/180/180?random=20")),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.red, offset: Offset(5, 5)),
              BoxShadow(color: Colors.purple, offset: Offset(-5, -5))
            ]),

        foregroundDecoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.5), shape: BoxShape.circle),
      ),

      // constraints:  BoxConstraints(

      //   maxWidth: 100
      // ),
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
      controller: _scrComtroller,
      padding: const EdgeInsets.all(16.0),
      // 对于每���建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
      // 在偶数行，该函数会为单词对添加一个ListTile row.
      // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
      // 注意，在小屏幕上，分割线看起来可能比较吃力。
      itemBuilder: (context, i) {
        return _buildRow(_suggestions[i], i);
      },
      itemCount: _suggestions.length,
      itemExtent: 60,
    );
  }

  Widget _buildRow(String pair, int index) {
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
      // trailing: new Icon(
      //   alreadySaved ? Icons.favorite : Icons.favorite_border,
      //   color: alreadySaved ? Colors.red : null,
      // ),
      //
      trailing: ExpandIcon(isExpanded: index % 3 == 0, onPressed: (isUp) {}),
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
          return _getChild(index, title);
        },
      ),
    );
  }

  Widget _getChild(int index, String titlle) {
    Widget _body;
    bool _needAppBar = true;
    switch (index) {
      case 0:
        _body = _testTable();
        break;

      case 1:
        _body = TestRow();
        break;

      case 2:
        _body = _testContainer();
        break;

      case 3:
        // _body = _testFlow();
        //
        _body = KLFlowDemo();

        break;

      case 4:
        _body = WirpDemo();
        break;

      case 5:
        _body = _testGridView();
        break;

      case 6:
        _body = _testOthers();
        break;
      case 7:
        _body = TestListCell();
        break;
      case 8:
        _body = _testListBody();
        break;

      case 9:
        _body = TestColumn();
        break;

      case 10:
        _body = TestCircle();
        break;

      case 11:
        _body = GridViewBuild();
        break;

      case 12:
        _body = TestExpand();
        break;

      case 13:
        _body = TestStack();
        break;

      case 14:
        _body = TestCard();
        break;

      case 15:
        _body = TestCardDemo();
        break;

      case 16:
        _body = AutocompleteBasicExample();
        break;

      case 17:
        _body = KLNativeViewDemo();
        break;

      case 18:
        _body = KLSliverDemo();
        _needAppBar = false;
        break;

      case 19:
        _body = KLDAtaColumn();
        _needAppBar = false;
        break;
      case 20:
        _body = KLDragAbleDemo();
        break;

          case 21:
        _body = NeedScrollPage();
        _needAppBar = false;
        break;

      default:
        _body = Text('no function');
        break;
    }

    if (_needAppBar) {
      return Scaffold(
        appBar: AppBar(
          title: Text(titlle),
        ),
        body: _body,
      );
    } else {
      return _body;
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

class CustomeSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions

    return [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.blue,
        ),
        onPressed: () {
          close(context, ' ');
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          height: 60,
          alignment: Alignment.center,
          child: Text(
            '$index',
            style: TextStyle(fontSize: 20),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: 10,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    //
    //
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('listTitle $index'),
            onTap: () {},
          );
        },
        separatorBuilder: (context, idnex) {
          return Divider();
        },
        itemCount: Random().nextInt(15));
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return GlowingOverscrollIndicator(
      child: child,
      axisDirection: axisDirection,
      color: Colors.red,
    );
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    // TODO: implement getScrollPhysics
    return ClampingScrollPhysics();
  }
}
