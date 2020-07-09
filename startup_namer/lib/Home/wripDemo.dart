import 'package:flutter/material.dart';
import 'package:startup_namer/listData.dart';

//如果一行展示不完会自动换行显示
class WirpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10, //行间距
        runSpacing: 5,//纵轴
runAlignment: WrapAlignment.end,
        // direction: Axis.vertical,
        alignment: WrapAlignment.start,
        children: listData.map((e) {
          return myButton(e["title"]);
        }).toList());
  }
}

// ignore: camel_case_types
class myButton extends StatelessWidget {
  final String text;

  myButton(this.text, {Key key}) : super(key: key);

  @override
  Widget build(Object context) {
    return RaisedButton(
      child: Text(this.text),
      textColor: Theme.of(context).accentColor,
      onPressed: () {
        print(this.text);
      },
    );
  }
}



 
