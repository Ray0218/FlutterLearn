import 'package:flutter/cupertino.dart';
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
              width: 300,
              child: Container(
                // height: 20,
                child: LinearProgressIndicator(),
              )
              //  Text('第一步注册页面'),
              ),
          Positioned(
              top: 100,
              left: 15,
              child: Container(
                // height: 20,
                child: CircularProgressIndicator(),
              )
              //  Text('第一步注册页面'),
              ),
          Positioned(
              top: 100,
              left: 100,
              child: Container(
                // height: 20,
                child: RefreshProgressIndicator(),
              )
              //  Text('第一步注册页面'),
              ),
          Positioned(
              top: 100,
              left: 200,
              child: Container(
                // height: 20,
                child: CupertinoActivityIndicator(
                  radius: 20,
                ),
              )
              //  Text('第一步注册页面'),
              ),
          Positioned(
              top: 200,
              child: RaisedButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed('/registerSecond');
                  Navigator.of(context)
                      .pushReplacementNamed('/registerSecond'); //替换路由
                },
                child: Text('下一步'),
              ))
        ],
      ),
    );
  }
}
