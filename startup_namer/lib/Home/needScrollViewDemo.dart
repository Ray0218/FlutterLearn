import 'package:flutter/material.dart';
import 'package:startup_namer/Setting/TabbarController.dart';

import '../slRandomClor.dart';

class NeedScrollPage extends StatefulWidget {
  @override
  _NeedScrollPageState createState() => _NeedScrollPageState();
}

class _NeedScrollPageState extends State<NeedScrollPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return <Widget>[
              SliverAppBar(
                // title: Text('SliverAppBar'),
                pinned: true,
                expandedHeight: 150,
                flexibleSpace: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: PageView(
controller: PageController(),
                    children: [
                      Image.network(
                        'https://picsum.photos/375/250?random=66',
                        fit: BoxFit.fill,
                      ),
                      Image.network('https://picsum.photos/350/250?random=21'),
                      Image.network('https://picsum.photos/350/250?random=63'),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: StickyTabBarDelegate(TabBar(

                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.white,
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                      
                      child: Container(
                        child: Text('data'),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    Tab(text: '技术'),
                  ],
                )),
              ),
            ];
          },
          body: TabBarView(controller: _tabController, children: [
            Center(
              child: getlist(context),
            ),
            Center(
              child: getlist(context),
            )
          ])),
    ));
  }

  Widget getlist(BuildContext context) {


    
    return Container(
        padding: EdgeInsets.only(top: 0),
        color: Colors.white,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: slRandomColor(),
                height: 50,
                child: Text(
                  '$index',
                  style: TextStyle(fontSize: 14),
                ),
              );
            },
          ),
        ));
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final chiild;

  StickyTabBarDelegate(this.chiild);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: Colors.grey,
      child: this.chiild,
    );
  }

  @override
  double get maxExtent => this.chiild.preferredSize.height;

  @override
  double get minExtent => this.chiild.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      false; // 如果内容需要更新，设置为true

}
