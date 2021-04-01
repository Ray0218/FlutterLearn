import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:startup_namer/slRandomClor.dart';

class CheckView extends StatefulWidget {
  CheckView({Key key}) : super(key: key);

  @override
  _CheckViewState createState() => _CheckViewState();
}

class _CheckViewState extends State<CheckView> {
  var flag = true;

  var sex = 1;

  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
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
                selected: this.flag, //控制文字高亮
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
            Container(
              color: slRandomColor(),
              child: Column(
                children: <Widget>[
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
                ],
              ),
            ),
            Switch(
                value: this.flag,
                onChanged: (value) {
                  setState(() {
                    this.flag = value;
                  });
                }),
                CupertinoSwitch(value: flag, onChanged: (bool value) { 

                  setState(() {
                                      flag = value;
                                    });

                 },),
            SwitchListTile(
                value: this.flag,
                title: Text('swithcA'),
                subtitle: Text('副标题'),
                selected: this.flag,
                secondary:
                    Icon(this.flag ? Icons.visibility : Icons.visibility_off),
                onChanged: (value) {
                  setState(() {
                    this.flag = value;
                  });
                }),
            Slider(
                value: _sliderValue,
                activeColor: Colors.orange,
                inactiveColor: Colors.blue,
                min: 0.0,
                max: 1.0,
                divisions: 100,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                }),
            Text('slider当前值:  ${this._sliderValue}'),
            CupertinoSlider(
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
              value: _sliderValue,
            )
          ],
        )
      ],
    );
  }
}
