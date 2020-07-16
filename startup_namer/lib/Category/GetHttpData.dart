import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';


class GetHttpDataPage extends StatefulWidget {
  GetHttpDataPage({Key key}) : super(key: key);

  @override
  _GetHttpDataPageState createState() => _GetHttpDataPageState();
}

class _GetHttpDataPageState extends State<GetHttpDataPage> {
  var mapData = {'name': '张三', 'age': 20};
  var strData = '{"name":"张三","age":20}';

  List _rList = [];

  @override
  void initState() {
    super.initState();

    this._getData();

    print(json.encode(mapData)); //map转json字符串

    print(json.decode(strData)); //json字符串转Map类型
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('网络请求'),
          actions: <Widget>[
            RaisedButton(
                child: Text('Get'),
                onPressed: () {
                  this._getData();
                }),
            RaisedButton(
                child: Text('Post'),
                onPressed: () {
                  this._postData();
                })
          ],
        ),
        body: this._rList.length > 0
            ? ListView.builder(
                itemCount: this._rList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(this._rList[index]['title']),
                  );
                })
            : Text('数据加载中'));
  }

  _getData() async {
    var url = 'http://a.itying.com/api/productlist';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      setState(() {
        this._rList = jsonResponse['result'];
      });
      print(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  _postData() async {
    var url = 'http://a.itying.com/api/productlist';
    var response =  await  Dio().get(url);

    

    print(response.data);
  }
}
