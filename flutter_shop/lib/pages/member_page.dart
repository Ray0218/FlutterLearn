import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/counter.dart';
import 'package:provide/provide.dart';

class MemberPage extends StatefulWidget {
  MemberPage({Key key}) : super(key: key);

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    var dd =
        'https://images.baixingliangfan.cn/compressedPic/20190121100327_1855.jpg';

    print(dd is String);

    return Scaffold(
      appBar: AppBar(
        title: Text('会员中心'),
      ),
      body: Container(
          child: Image.network(
        dd,
        fit: BoxFit.cover,
      )),
    );
  }
}
