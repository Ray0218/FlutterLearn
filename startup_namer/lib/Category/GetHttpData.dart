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

  List<BookModel> _rList = [];

  @override
  void initState() {
    super.initState();

    print(json.encode(mapData)); //map转json字符串

    print(json.decode(strData)); //json字符串转Map类型

    // this._getData().then((value) => print('then ======= $value'));
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
      body: FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print('connectionState: ${snapshot.connectionState}');

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('waiting ...'),
            );
          }

          return ListView(
            children: snapshot.data.map<Widget>((item) {
              return ListTile(
                title: Text(item.rTitle),
                subtitle: Text(item.rAuthor),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.rImageUrl),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Future<List<BookModel>> _getData() async {
    // var url = 'http://a.itying.com/api/productlist';
    var url = Uri.parse('http://resources.ninghao.net/demo/posts.json');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      // print(jsonResponse);

      return jsonResponse['posts'].map<BookModel>((item) {
        return BookModel.fromDictionary(item);
      }).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');

      throw Exception('Fail tot get Data');
    }
    

    // http.get(url).then((response) {
    //   if (response.statusCode == 200) {
    //     var jsonResponse = json.decode(response.body);

    //     setState(() {
    //       this._rList = jsonResponse['posts'].map<BookModel>((item) {
    //         return BookModel.fromDictionary(item);
    //       }).toList();
    //     });
    //     print(jsonResponse);
    //   } else {
    //     print('Request failed with status: ${response.statusCode}.');
    //   }
    // });
  }

  _postData() async {
    var url = 'http://resources.ninghao.net/demo/posts.json';

    var response = await Dio().get(url);

    final Map responseData = response.data;
    List rMapArr = responseData['posts'];

    List<BookModel> rModelArr =
        rMapArr.map((e) => BookModel.fromDictionary(e)).toList();

    // print(response.data);

    print(rModelArr);
  }
}

class BookModel {
  int id;
  String rTitle;
  String rAuthor;
  String rDesc;
  String rImageUrl;

  BookModel({this.id, this.rTitle, this.rAuthor, this.rImageUrl, this.rDesc});

  BookModel.fromDictionary(Map rDict) {
    id = rDict['id'];
    rTitle = rDict['title'];
    rAuthor = rDict['author'];
    rImageUrl = rDict['imageUrl'];
    rDesc = rDict['description'];
  }

  Map rModelToJson() {
    return {
      "title": rTitle,
      'author': rAuthor,
      'imageUrl': rImageUrl,
      'description': rDesc
    };
  }
}
