import 'package:flutter/material.dart';
import 'package:startup_namer/listData.dart';

class SliverDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('标题'),
            // pinned: true, //固定导航
            floating: true, //下拉时是否立刻显示,不管是否滑到了顶部

            expandedHeight: 150,

            flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'SliverAppBar',
                  style: TextStyle(color: Colors.white),
                ),
                background: Image.network(
                  'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2816775233,230540815&fm=26&gp=0.jpg',
                  fit: BoxFit.cover,
                )
                ),
          ),

          SliverSafeArea(
              //防止iphoneX顶部刘海

              sliver: SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGridDemo(),
          )),

          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverListDemo(),
          ),
          // )
        ],
      ),
    );
  }
}

List images = listData.map((e) {
  return e['imageUrl'];
}).toList();

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 32),
          child: Material(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            clipBehavior: Clip.hardEdge,
            elevation: 14.0, //阴影大小
            shadowColor: Colors.greenAccent.withOpacity(0.5),
            child: Stack(
              children: <Widget>[
                AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      images[index],
                      fit: BoxFit.cover,
                    )),
                Positioned(
                    top: 30,
                    left: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          listData[index]['title'],
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        Text(listData[index]['author'],
                            style: TextStyle(color: Colors.white, fontSize: 16))
                      ],
                    ))
              ],
            ),
          ),
        );
      }, childCount: images.length),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.8),
      delegate: SliverChildBuilderDelegate((context, index) {
        return Image.network(
          images[index],
          fit: BoxFit.cover,
        );
      }, childCount: images.length),
    );
  }
}
