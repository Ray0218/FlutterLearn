import 'package:flutter/material.dart';
import 'package:startup_namer/Setting/SliderDemo.dart';
import 'package:startup_namer/slRandomClor.dart';
import 'package:startup_namer/listData.dart';

class TestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: slRandomColor(),
      margin: EdgeInsets.all(30),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          width: 300,
          color: Colors.blue,
          child: AspectRatio(
            //铺满父组件
            //铺满整个组件
            aspectRatio: 4.0, //子组件宽高比
            child: Container(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

class TestCardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
      children: listData.map((value) {
        return Card(
          
          margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
          color: slRandomColor(),
          child: Column(
            children: <Widget>[
              AspectRatio(
                child: ClipRect(
                  clipBehavior: Clip.hardEdge,
                  child: FittedBox(
fit: BoxFit.cover,
                    child: FadeInImage(
                    placeholder:  NetworkImage('https://picsum.photos/200/200?random=44'),
                    
                     image:  NetworkImage(value['imageUrl'])),
                  ),
                ),
                aspectRatio: 2,
              ),
               ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(value['imageUrl']),
                ),
                title: Text(value['title']),
                subtitle: Text(
                  value['summary'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
