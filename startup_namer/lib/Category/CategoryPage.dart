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


    
    return Column(
      children: <Widget>[
        RaisedButton(
            child: Text('调转到search页面'),
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('search页面'),
                  ),
                  body: SearchPage(),
                );
              }));
            }),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
            child: Text('调转到search页面,匿名路由'),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            }),
      ],
    );
  }
}
