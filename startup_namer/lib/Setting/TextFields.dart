import 'package:flutter/material.dart';

class TextView extends StatefulWidget {
  TextView({Key key}) : super(key: key);

  @override
  _TextViewState createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  var _userNameField = TextEditingController();

  var _introduce;

  @override
  void initState() {
    super.initState();

    _userNameField.text = "张三";
    _introduce = '个人简介';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: this._userNameField, //设置初始值
          onChanged: (value) {
            _userNameField.text = value;
          },
          decoration: InputDecoration(hintText: '请输入姓名'),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          maxLength: 12, //文字长度
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.smartphone),
              labelText: '密码',
              hintText: '请输入6~12位密码',
              border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          maxLines: 3, //行数现在

          onChanged: (value) {
            this._introduce = value;
          },
          decoration: InputDecoration(
              labelText: '用户简介',
              hintText: '请输入简介',
              border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          height: 40,
          child: RaisedButton(
            onPressed: () {
              print(this._userNameField.text + this._introduce);
            },
            child: Text('提交'),
          ),
        )
      ],
    );
  }
}
