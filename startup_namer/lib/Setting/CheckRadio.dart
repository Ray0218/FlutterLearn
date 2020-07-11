import 'package:flutter/material.dart';

class CheckView extends StatefulWidget {
  CheckView({Key key}) : super(key: key);

  @override
  _CheckViewState createState() => _CheckViewState();
}

class _CheckViewState extends State<CheckView> {
  var flag = true;

  var sex = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Checkbox(
                activeColor: Colors.purple,
                value: this.flag,
                onChanged: (v) {
                  setState(() {
                    this.flag = v;
                  });
                }),
            Text(this.flag ? '选中' : '未选中')
          ],
        ),
        SizedBox(
          height: 15,
        ),
        CheckboxListTile(
            title: Text('标题'),
            subtitle: Text('二级标题'),
            secondary: Icon(Icons.help),
            value: this.flag,
            onChanged: (value) {
              setState(() {
                this.flag = value;
              });
            }),
        Row(
          children: <Widget>[
            Text('男'),
            Radio(
                value: 1,
                groupValue: this.sex,
                onChanged: (value) {
                  setState(() {
                    this.sex = value;
                  });
                }),
            Text('女'),
            Radio(
                value: 2,
                groupValue: this.sex,
                onChanged: (value) {
                  setState(() {
                    this.sex = value;
                  });
                }),
            Text('保密'),
            Radio(
                value: 3,
                groupValue: this.sex,
                onChanged: (value) {
                  setState(() {
                    this.sex = value;
                  });
                })
          ],
        ),
        RadioListTile(
          value: 1,
          groupValue: this.sex,
          onChanged: (value) {
            setState(() {
              this.sex = value;
            });
          },
          secondary: Icon(Icons.help),
          title: Text('标题'),
          subtitle: Text('二级标题'),
          selected: this.sex == 1, //让文字有选中效果
        ),
        RadioListTile(
          value: 2,
          groupValue: this.sex,
          onChanged: (value) {
            setState(() {
              this.sex = value;
            });
          },
          secondary: Icon(Icons.help),
          title: Text('标题'),
          subtitle: Text('二级标题'),
        ),
        Switch(
            value: this.flag,
            onChanged: (value) {
              setState(() {
                this.flag = value;
              });
            })
      ],
    );
  }
}
