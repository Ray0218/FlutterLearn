import 'package:flutter/material.dart';
import 'SearchPage.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
      ),
     
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text('调转到search页面,基本路由跳转'),
              onPressed: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return SearchPage(
                    arguments: '基本路由传值',
                  );
                }));
              }),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
              child: Text('调转到search页面,命名路由'),
              onPressed: () {
                // Navigator.pushNamed(context, '/search',arguments: {'id':'命名路由'});

                Navigator.pushNamed(context, '/search', arguments: '命名路由');
              }),
          RaisedButton(
              child: Text('调转到商品页面'),
              onPressed: () {
                Navigator.pushNamed(context, '/product');
              }),
        ],
      ),
    );
  }
}
