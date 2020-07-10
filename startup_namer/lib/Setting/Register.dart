import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 50,
            child: Text('第一步注册页面'),
          ),
          Positioned(
              top: 100,
              child: RaisedButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed('/registerSecond');
                  Navigator.of(context).pushReplacementNamed('/registerSecond');//替换路由
                },
                child: Text('下一步'),
              ))
        ],
      ),
    );
  }
}
