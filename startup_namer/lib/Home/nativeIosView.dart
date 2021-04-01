import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KLNativeViewDemo extends StatefulWidget {
  KLNativeViewDemo({Key key}) : super(key: key);

  @override
  _KLNativeViewDemoState createState() => _KLNativeViewDemoState();
}

class _KLNativeViewDemoState extends State<KLNativeViewDemo> {
  static const _platform = const MethodChannel("Flutter_channel");

  static const _messageChannel =
      const BasicMessageChannel("BasicMessageChannel", StandardMessageCodec());

  var _index = 0;

  @override
  void initState() {
    super.initState();

    _messageChannel.setMessageHandler((message) {

      print('收到原生传过来的值') ;
      setState(() {
        _index = message["rIndex"];
      });
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              _platform.invokeMethod('setText', {'name': '名声', 'age': 18});
            },
            child: Text('传值到原生view')),
        Text('iOS 原生返回的数据$_index'),
        Expanded(child: plateformView()),
      ],
    );
  }

  Widget plateformView() {
    if (Platform.isIOS) {
      return UiKitView(
        viewType: 'platform_view',
        creationParams: {'text': 'Flutter 传给iOS 原生view的参数'},
        creationParamsCodec: StandardMessageCodec(), //编码格式
      );
    } else {
      return Text('android 原生 view');
    }
  }
}
