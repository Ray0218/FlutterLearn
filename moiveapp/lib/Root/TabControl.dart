import 'package:flutter/material.dart';
import 'package:moiveapp/Home/HomePage.dart';
import 'package:moiveapp/My/MyPage.dart';
import 'package:moiveapp/Recomand/RecomandPage.dart';

class TabControlPage extends StatefulWidget {
  TabControlPage({Key key}) : super(key: key);

  @override
  _TabControlPageState createState() => _TabControlPageState();
}

class _TabControlPageState extends State<TabControlPage> {
  int _currentIndex = 0;

  List _pages = [HomePage(), FuturePage(), TopPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          iconSize: 26,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Google翻译')),
            BottomNavigationBarItem(
                icon: Icon(Icons.airline_seat_recline_normal),
                title: Text('Boos直聘')),
            BottomNavigationBarItem(
                icon: Icon(Icons.memory), title: Text('Top250')),
          ]),
    );
  }
}
