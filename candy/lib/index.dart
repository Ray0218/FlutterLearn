import 'package:candy/active/active_page.dart';
import 'package:candy/home/home_page.dart';
import 'package:candy/message/message_page.dart';
import 'package:candy/mine/my_page.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _rCurrentIndex = 0;
      List<Widget> pages = [
    HomePage(),
    ActivePage(),
    MessagePage(),
    MyPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _rCurrentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              _rCurrentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit), title: Text('日记')),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), title: Text('消息')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('我的')),
          ]),
      body: IndexedStack(
        index: _rCurrentIndex,
        children: pages
      ),
    );
  }
}
