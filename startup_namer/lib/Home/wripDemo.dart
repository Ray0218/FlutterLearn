import 'package:flutter/material.dart';
import 'package:startup_namer/listData.dart';

//如果一行展示不完会自动换行显示
class WirpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {




return  Wrap(
   spacing: 8.0, // gap between adjacent chips
   runSpacing: 4.0, // gap between lines
   children: <Widget>[
     Chip(
       avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('AH')),
       label: Text('Hamilton'),
     ),
     Chip(
       avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('ML')),
       label: Text('Lafayette'),
     ),
     Chip(
      avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('HM')),  
          label: Text('Mulligan'),
     ),
     Chip(
       avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('JL')),
       label: Text('Laurens'),
     ),
   ],
 );



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



 
