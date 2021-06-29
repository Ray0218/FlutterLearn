import 'dart:async';

import 'package:flutter/material.dart';

class CustomerDialog extends Dialog {
  final String title;
  final String content;

  CustomerDialog(this.title, {this.content = '默认文本'});

  @override
  Widget build(BuildContext context) {
    _showTimer(context);
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Text(this.title),
                        alignment: Alignment.center,
                      ),
                      Align(
                        child: InkWell(
                          child: Icon(Icons.close),
                          onTap: () => Navigator.pop(context),
                        ),
                        alignment: Alignment.topRight,
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(this.content),
                )
              ],
            ),
          ),
        ));
  }

  _showTimer(context) {
    var rTimer = Timer.periodic(Duration(milliseconds: 3000), (timer) {
      Navigator.pop(context);
      timer.cancel(); //取消定时器
    });
  }

 

}
