import 'package:flutter/material.dart';
import 'package:startup_namer/Category/CategoryPage.dart';
import 'package:startup_namer/Home/HomePage.dart';
import 'package:startup_namer/Setting/SettingPage.dart';

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
      // appBar: new AppBar(
      //   title: new Text(
      //     'Demo',
      //     textAlign: TextAlign.center,
      //   ),
      //   backgroundColor: Colors.yellow,
      // ),

      floatingActionButton: Container(
        height: 60,
        width: 60,
        margin: EdgeInsets.only(top: 8),
        // padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.red),
        // color: Colors.red, //color和decoration不能同时使用
        child: FloatingActionButton(
          backgroundColor:
              this._currentIndex == 1 ? Colors.purple : Colors.grey,
          onPressed: () {
            print('点击了按钮');
            setState(() {
              this._currentIndex = 1;
            });
          },
          tooltip: "提示",
          highlightElevation: 30,
          child: Icon(
            Icons.flag,
            color: Colors.orange,
            size: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   child: Container(
      //     height: 80,
      //     color: Colors.purple,
      //   ),
      // ),
      // 
      // 
 
      bottomNavigationBar:  BottomNavigationBar(

        

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
