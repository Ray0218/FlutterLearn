import 'package:flutter/material.dart';

class TestDemo extends StatelessWidget {
  const TestDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Demo'),
      ),
      body: Container(),
    );
  }
}

class KLTestDemo {
  static greet(String name) {
    return 'hello $name';
  }
}
