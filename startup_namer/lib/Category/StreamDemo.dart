import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  const StreamDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  StreamDemoHome({Key key}) : super(key: key);

  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamDemoSubScription;

  StreamSubscription _streamControlSubScription;

  StreamSubscription _mutilStreamControlSubScription;

  StreamController<String> _streaControl;

  StreamSink _sinkDemo;

  StreamController<String> _mutilStreaControl;

  @override
  void dispose() {
    super.dispose();

    _streaControl.close();
  }

  @override
  void initState() {
    super.initState();

    print('create stream');

    Stream<String> _streamDemo = Stream.fromFuture(fetchData(false));

    print('initsta complete');
    _streamDemoSubScription = _streamDemo.listen((event) {
      print(event);
    }, onError: (error) {
      print(error);
    }, onDone: () {
      print('done');
    });

    _streaControl = StreamController<String>();
    _streamControlSubScription = _streaControl.stream.listen((event) {
      print(event);
    }, onError: (error) {
      print(error);
    }, onDone: () {
      print('done');
    });

    _sinkDemo = _streaControl.sink;

    _mutilStreaControl = StreamController.broadcast();

//第一个订阅
    _mutilStreamControlSubScription = _mutilStreaControl.stream.listen((event) {
      print('第一个订阅 $event');
    }, onError: (error) {
      print(error);
    }, onDone: () {
      print('done');
    });

//第二个订阅
    _mutilStreaControl.stream.listen((event) {
      print('第二个订阅 $event');
    }, onError: (error) {
      print(error);
    }, onDone: () {
      print('done');
    });
  }

  Future<String> fetchData(bool isControl) async {
    await Future.delayed(Duration(seconds: 5));

    if (isControl) {
      return 'ControlData';
    }
    return 'hello';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(onPressed: _pauseStream, child: Text('Pause')),
            FlatButton(onPressed: _resumeStream, child: Text('Resume')),
            FlatButton(onPressed: _cancelStream, child: Text('Cancel')),
            FlatButton(onPressed: _addStream, child: Text('Add')),
          ],
        ),
      ),
    );
  }

  void _pauseStream() {
    print('pauseStream');
    _streamDemoSubScription.pause();
    _streamControlSubScription.pause();
  }

  void _resumeStream() {
    print('_resumeStream');

    _streamDemoSubScription.resume();
    _streamControlSubScription.resume();
  }

  void _cancelStream() {
    print('_cancelStream');

    _streamDemoSubScription.cancel();

    _streamControlSubScription.cancel();
  }

  void _addStream() async {
    print('add Data');

    String data = await fetchData(true);
    _streaControl.add('control add $data');

    _sinkDemo.add('sink add $data');

    _mutilStreaControl.add('mutil add $data');
  }
}
