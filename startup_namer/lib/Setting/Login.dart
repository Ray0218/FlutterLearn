import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        centerTitle: true, //标题居中
        backgroundColor: Colors.cyan,
        leading: IconButton(
            //左侧导航栏按钮
            icon: Icon(Icons.menu),
            onPressed: () {
              print('点击menue');
            }),

        actions: <Widget>[
          //右侧导航按钮

          IconButton(
              //左侧导航栏按钮
              icon: Icon(Icons.search),
              onPressed: () {
                print('点击右侧');
              }),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 50,
            child: Text('请点击登录按钮进行登录'),
          ),
          Positioned(
              top: 100,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('登录'),
              ))
        ],
      ),
    );
  }
}
