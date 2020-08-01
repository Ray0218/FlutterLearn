import 'package:moiveapp/MoveList.dart';
import 'package:flutter/material.dart';
class FuturePage extends StatelessWidget {
  const FuturePage({Key key}) : super(key: key);

  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: Text('即将上映'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: MoveList(typeStr: 'coming_soon',),
    );
  }
}