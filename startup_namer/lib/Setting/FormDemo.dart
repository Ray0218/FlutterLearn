import 'package:flutter/material.dart';

class FormDemoPage extends StatefulWidget {
  FormDemoPage({Key key}) : super(key: key);

  @override
  _FormDemoPageState createState() => _FormDemoPageState();
}

class _FormDemoPageState extends State<FormDemoPage> {
  final registerFormKey = GlobalKey<FormState>();

  bool autoValidate = false;
  String userName, passWord;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: registerFormKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              onSaved: (newValue) {
                userName = newValue;
              },
              validator: validateUserName,
              autovalidate: autoValidate,
              decoration: InputDecoration(
                  hintText: '请输入用户名', helperText: '数字字母下划线', labelText: '用户名'),
            ),
            TextFormField(
              obscureText: true,
              onSaved: (newValue) {
                passWord = newValue;
              },
              validator: validatePassword,
              autovalidate: autoValidate,
              decoration: InputDecoration(
                  hintText: '请输入密码', helperText: '数字字母下划线', labelText: '密码'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: submitRegister,
                color: Theme.of(context).accentColor,
                elevation: 0.0,
                child: Text('提交'),
              ),
            )
          ],
        ));
  }

  void submitRegister() {
    if (registerFormKey.currentState.validate()) {
      //验证成功
      registerFormKey.currentState.save();

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('用户注册中....'),
      ));

      debugPrint('用户名: $userName');

      debugPrint('密码: $passWord');
    } else {
      setState(() {
        //打开自动验证功能
        autoValidate = true;
      });
    }
  }

  String validateUserName(String value) {
    if (value.isEmpty) {
      return '用户名不能为空';
    }

    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return '密码不能为空';
    }

    return null;
  }
}

class FieldTest extends StatefulWidget {
  FieldTest({Key key}) : super(key: key);

  @override
  _FieldTestState createState() => _FieldTestState();
}

class _FieldTestState extends State<FieldTest> {
  var sex = 1;

  String userName;

  List _hobby = [
    {
      'checked': true,
      'title': "吃饭了",
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

  final textEditController = TextEditingController(); //文本监听器

  @override
  void dispose() {
    super.dispose();

    textEditController.dispose();
  }

  @override
  void initState() {
    super.initState();

    textEditController.addListener(() {
      print('文本监听器' + textEditController.text);
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
              // onChanged: (value) {
              //   this.userName = value;
              // },

              controller: textEditController,
              onSubmitted: (value) {
                print(value);
              },
              decoration: InputDecoration(
                  labelText: '姓名',
                  hintText: '学员姓名',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.purple),
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
