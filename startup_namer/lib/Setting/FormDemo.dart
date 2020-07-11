import 'package:flutter/material.dart';


 
class FormDemoPage extends StatefulWidget {
  FormDemoPage({Key key}) : super(key: key);

  @override
  _FormDemoPageState createState() => _FormDemoPageState();
}

class _FormDemoPageState extends State<FormDemoPage> {
  var sex = 1;

  String userName;

  List _hobby = [
    {
      'checked': true,
      'title': "吃饭",
    },
    {
      'checked': true,
      'title': "睡觉",
    },
    {
      'checked': true,
      'title': "玩游戏",
    }
  ];

  List<Widget> _getHobbyWidget() {
    return _hobby.map((e) {
      return CheckboxListTile(
          title: Text(e['title']),
          selected: e['checked'],
          value: e['checked'],
          onChanged: (value) {
            setState(() {
              e['checked'] = value;
            });
          });
    }).toList();
  }

  void _sexChanged(value) {
    setState(() {
      this.sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('学员信息登记系统'),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                this.userName = value;
              },
              decoration: InputDecoration(
                  hintText: '学员姓名', border: OutlineInputBorder()),
            ),
            Row(
              children: <Widget>[
                Text('性别'),
                Radio(
                    value: 1,
                    groupValue: this.sex,
                    onChanged: this._sexChanged),
                Text('男'),
                Radio(
                    value: 2,
                    groupValue: this.sex,
                    onChanged: this._sexChanged),
                Text('女'),
              ],
            ),
            Wrap(children: this._getHobbyWidget()),
            Container(
              height: 40,
              width: double.infinity,
              child: RaisedButton(
                  child: Text('提交'),
                  color: Colors.blue,
                  onPressed: () {
                    print(this.userName + (this.sex == 1 ? '男' : '女'));
                  }),
            )
          ],
        ));
  }
}
