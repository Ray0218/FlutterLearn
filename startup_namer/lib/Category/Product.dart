import 'package:flutter/material.dart';

class ProudctPage extends StatefulWidget {
  ProudctPage({Key key}) : super(key: key);

  @override
  _ProudctPageState createState() => _ProudctPageState();
}

class _ProudctPageState extends State<ProudctPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('商品'),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                child: Text('调转到商品详情页面'),
                onPressed: () {
                  Navigator.pushNamed(context, '/productDetail',
                      arguments: {'id': '商品详情页面'});
                }),
          ],
        ));
  }
}
