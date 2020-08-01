import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  TextFieldPage({Key key}) : super(key: key);

  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      color: Colors.white,
elevation: 0, //去掉底部线条
    
      child: Container(
        padding: EdgeInsets.only(left: 12,right: 12),
        height: 120,
        child: TextField(
          maxLines: 999,
          style: TextStyle(fontSize: 16,color: Colors.black),
          cursorColor: Colors.red, //光标颜色
          cursorWidth: 2.0,
          decoration:
              InputDecoration(hintText: '输入翻译', 
              border: InputBorder.none
              ),
              onTap: (){},
              onSubmitted: (value){

              },
        ),

        
      ),
    );
  }
}
