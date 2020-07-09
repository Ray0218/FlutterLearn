import 'package:flutter/material.dart';
import 'package:startup_namer/Category/CategoryPage.dart';
import 'package:startup_namer/Home/HomePage.dart';
import 'package:startup_namer/Setting/SettingPage.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  List _pageList = [
    HomePage(),
    CategoryPage(),
    SettingPage(),
        
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Demo',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.yellow,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: () {}),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,//选中的索引
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        fixedColor: Colors.purple,//选中的颜色
        type: BottomNavigationBarType.fixed,//配置底部可以有多个按钮
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('分类'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('我的'),
          ),

          
        ],
      ),
      body: this._pageList[this._currentIndex],
    
    );
  }
}
