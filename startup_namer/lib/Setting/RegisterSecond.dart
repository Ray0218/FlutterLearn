import 'package:flutter/material.dart';
import 'package:startup_namer/tabBar.dart';

class RegisterSecondPage extends StatefulWidget {
  RegisterSecondPage({Key key}) : super(key: key);

  @override
  _RegisterSecondPageState createState() => _RegisterSecondPageState();
}

class _RegisterSecondPageState extends State<RegisterSecondPage> {
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
            child: Text('第二步注册'),
          ),
          Positioned(
              top: 100,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/registerThird');
                },
                child: Text('确定'),
              ))
        ],
      ),
    );
  }
}

class RegisterThirdPage extends StatefulWidget {
  RegisterThirdPage({Key key}) : super(key: key);

  @override
  _RegisterThirdPageState createState() => _RegisterThirdPageState();
}

class _RegisterThirdPageState extends State<RegisterThirdPage> {
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
            child: Text('第三步步注册'),
          ),
          Positioned(
              top: 100,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(builder: (context) {
                    return Tabs(
                      index: 2,
                    );
                  }), (route) => route == null);
                },
                child: Text('跳转都根目录'),
              ))
        ],
      ),
    );
  }
}
