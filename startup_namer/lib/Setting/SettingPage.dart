import 'package:flutter/material.dart';
import 'package:startup_namer/tabBar.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.red,
                      labelColor: Colors.blue,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: <Widget>[
                        Tab(
                          text: '登录',
                        ),
                        Tab(text: '注册'),
                        Tab(text: '推荐'),
                        Tab(text: '推荐'),
                        Tab(text: '推荐'),
                        Tab(text: '推荐'),
                        Tab(text: '推荐'),
                        Tab(text: '推荐'),
                      ])),
            ],
          ),
          // bottom: TabBar(tabs: <Widget>[
          //   Tab(
          //     text: '热门',
          //   ),
          //   Tab(text: '推荐'),
          // ]),
        ),
        body: TabBarView(children: [
          ListView(
            children: <Widget>[
              ListTile(
                title: Text('跳转到登录'),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
              ListTile(
                title: Text('跳转到tabbarController'),
                onTap: () {
                  Navigator.pushNamed(context, '/tabbatController');
                },
              ),
              ListTile(
                title: Text('热门dd'),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
          ListView(
            children: <Widget>[
              ListTile(
                title: Text('跳转注册'),
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
              ),
              ListTile(
                title: Text('推荐dd'),
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
              ),
              ListTile(
                title: Text('推荐dd'),
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
              ),
            ],
          ),
          Text('dd'),
          Text('dd'),
          Text('dd'),
          Text('dd'),
          Text('dd'),
          Text('dd'),
        ]),
      ),
    );
  }
}
