import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firstDemo/slRandomClor.dart';

import 'package:firstDemo/listData.dart';

class TestListCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PeronModel> _getData() {
      var tempList = listData.map((e) {
        return PeronModel(
          title: e['title'],
          author: e['author'],
          summary: e['summary'],
          image: Image.network(
            e['imageUrl'],
            fit: BoxFit.cover,
          ),
        );
      });

      return tempList.toList();
    }

    var dataArr = <PeronModel>[];

    var random = Random();

    dataArr.addAll(_getData());
    return ListView.separated(
      itemBuilder: (context, index) {
        // return Card(
        //   child: Center(
        //     child: Text('toly $index'),
        //     heightFactor: 2,
        //   ),
        //   margin: EdgeInsets.all(5),
        // );

        return ListItemView(
          data: dataArr[index],
          clickListener: () {
            print(index);
          },
        );
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Container(
            color: slRandomColor(),
            child: Text('分割线'),
          ),
        );
      },
      itemCount: dataArr.length,
    );
  }
}

//cellmodel
class PeronModel {
  Image image; //图片
  var title;
  var author;
  var summary;
  PeronModel({this.image, this.title, this.author, this.summary});
}

typedef OnItemClickListner = void Function();

class ListItemView extends StatelessWidget {
  final PeronModel data;
  final OnItemClickListner clickListener;

  ListItemView({Key key, this.data, this.clickListener}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var headerIcon = Container(
      //头像
      width: 70,
      height: 70,

      // child: Padding(
      //     padding: EdgeInsets.all(3),
      //     child:  data.image,

      //     ),

// 利用clipOval实现圆角图片
      child: ClipOval(child: data.image),

      //利用BoxDecoration实现圆角图片
      // decoration: BoxDecoration(
      //   color: Colors.purple,
      //   // shape: BoxShape.circle,
      //   borderRadius: BorderRadius.circular(35),
      //   image: DecorationImage(
      //     image: NetworkImage(
      //         'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1530226751,710527850&fm=26&gp=0.jpg'),
      //   ),
      // )
    );

    var desc = Column(
      //中间描述
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          color: Colors.lightGreen[200],
          child: Text(data.title),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Card(
            child: Text(data.author),
            color: Colors.lightBlue[50],
          ),
        ),
      ],
    );

    var contentDes = Text(data.summary);

    var item = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 10,
        ),
        headerIcon,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: desc,
        ),
        Expanded(
          child: contentDes,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );

    var result = Card(
        elevation: 5,
        child: InkWell(
          onTap: clickListener,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: item,
          ),
        ));

    return result;
  }
}
