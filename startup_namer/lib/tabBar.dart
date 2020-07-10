import 'package:flutter/material.dart';
import 'package:startup_namer/Category/CategoryPage.dart';
import 'package:startup_namer/Home/HomePage.dart';
import 'package:startup_namer/Setting/SettingPage.dart';
import 'package:startup_namer/slRandomClor.dart';

class Tabs extends StatefulWidget {
  final int index;

  Tabs({Key key, this.index = 0}) : super(key: key);

  @override
  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex;

  _TabsState(indext) {
    this._currentIndex = indext;
  }
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
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[

            DrawerHeader(child: Text('你好')),
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
        child: Text('右侧侧边栏'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex, //选中的索引
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },

        fixedColor: Colors.purple, //选中的颜色
        type: BottomNavigationBarType.fixed, //配置底部可以有多个按钮
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
