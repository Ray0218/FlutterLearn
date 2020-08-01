import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio = Dio();

class MoveList extends StatefulWidget {
  final String typeStr;
  MoveList({Key key, this.typeStr}) : super(key: key);

  @override
  _MoveListState createState() => _MoveListState();
}

class _MoveListState extends State<MoveList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          child: Text('get'),
          onPressed: () {
            getMoiveList();
          }),
    );


   }

  int page = 1;
  int pagesize = 10;
  var moveList = [];

  getMoiveList() async {
    int offset = (page - 1) * pagesize;

    try {
      Response response = await dio.get(
          'https://www.liulongbin.top:3005/api/v2/moive/${widget.typeStr}?start=$offset&count=$pagesize');

      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
