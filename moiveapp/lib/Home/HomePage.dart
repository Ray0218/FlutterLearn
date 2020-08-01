import 'package:flutter/material.dart';
import 'DrawView.dart';
import 'index_page.dart';
import 'textFild_page.dart';
import 'iconButton_page.dart';
import 'RecordPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Google翻译'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        drawer: DrawView(),
        body: Column(
          children: <Widget>[
            IndexBody(),
            Material(
              elevation: 5,
              color: Colors.white,
               shadowColor: Colors.black45,
                
               child: Column(
                children: <Widget>[TextFieldPage(), IconButtonsPage(),
                
                Divider(height: 10,color: Colors.white,)],
              ),
            ),

            RecordPage()
          ],
        ));
  }
}
