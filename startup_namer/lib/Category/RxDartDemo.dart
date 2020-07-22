import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  const RxDartDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDart'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  RxDartDemoHome({Key key}) : super(key: key);

  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;

  String _titleStr = 'nothing';
  @override
  void initState() {
    super.initState();
    _textFieldSubject = PublishSubject<String>();

    _textFieldSubject.debounceTime( //间隔0.5s后再执行后续
      
      Duration(milliseconds: 500)).where((event) => event.length > 4).map((event) => 'map: $event').listen((event) {
      print(event);

      setState(() {
        _titleStr = event;
      });
    });

  }


@override
  void dispose() {
     super.dispose();
        _textFieldSubject.close();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            heightFactor: 2.5,
            child: Text(_titleStr),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '测试RxDart',
            ),
            onChanged: (value) {
              _textFieldSubject.add(value);
            },
            onSubmitted: (value) {
              _textFieldSubject.add('submit: $value');
            },
          )
        ],
      ),
    );
  }
}
