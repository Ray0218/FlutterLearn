
import 'package:flutter/material.dart';
import 'package:moiveapp/MoveList.dart';
 
 
 class TopPage extends StatelessWidget {
   const TopPage({Key key}) : super(key: key);
 
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top250'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: MoveList(typeStr: 'top250',),
    );
  }
 }