import 'package:flutter/material.dart';

class TabbarControllerPage extends StatefulWidget {
  TabbarControllerPage({Key key}) : super(key: key);

  @override
  _TabbarControllerPageState createState() => _TabbarControllerPageState();
}

class _TabbarControllerPageState extends State<TabbarControllerPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() { //生命周期
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tabarController'),
        bottom: TabBar(controller: this._tabController, tabs: <Widget>[
          Tab(text: '热销'),
          Tab(text: '推荐'),
        ]),
      ),
      body: TabBarView(controller: this._tabController, children: <Widget>[
        Center(
          child: Text('热销'),
        ),
        Center(
          child: Text('推荐'),
        ),
      ]),
    );
  }
}
