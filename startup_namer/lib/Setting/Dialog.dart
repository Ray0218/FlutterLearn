import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'CustomerDialog.dart';

class DialogView extends StatefulWidget {
  DialogView({Key key}) : super(key: key);

  @override
  _DialogViewState createState() => _DialogViewState();
}

class _DialogViewState extends State<DialogView> {
  void _showAlterDialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示信息'),
          content: Text('确定要删除吗?'),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('取消')),
            FlatButton(
                onPressed: () {
                  print('点击确定');
                  Navigator.pop(context, '确定');
                },
                child: Text('确定')),
          ],
        );
      },
      //child: Text('sf')//child和builder不能同时设置
    );

    print(result);
  }

  void _showSimpleDialog() async {
    var result = await showDialog(
      barrierDismissible: false, //点击背景隐藏
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('选择内容'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Option A'),
              onPressed: () {
                print('Option A');

                Navigator.pop(context, 'A');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('Option B'),
              onPressed: () {
                print('Option B');
                Navigator.pop(context, 'B');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('Option C'),
              onPressed: () {
                print('Option C');
                Navigator.pop(context, 'C');
              },
            )
          ],
        );
      },
    );

    print(result);
  }

  void _showModelBottomSheet() async {
    var result = await showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('相册'),
                  onTap: () {
                    Navigator.pop(context, '相册');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('相机'),
                  onTap: () {
                    Navigator.pop(context, '相机');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('其他'),
                  onTap: () {
                    Navigator.pop(context, '其他');
                  },
                ),
              ],
            ),
          );
        });
    print(result);
  }

  FlutterToast flutterToast;

  @override
  void initState() {
    super.initState();
    flutterToast = FlutterToast(context);
  }

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.greenAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text("This is a Custom Toast"),
      ],
    ),
  );

  _showToast() {
    flutterToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: Text('AlertDialog的用法'),
          onTap: () {
            _showAlterDialog();
          },
        ),
        ListTile(
          title: Text('SimpleDialog的用法'),
          onTap: () {
            _showSimpleDialog();
            print('_showSimpleDialog');
          },
        ),
        ListTile(
          title: Text('_showModelBottomSheet用法'),
          onTap: () {
            _showModelBottomSheet();
          },
        ),
        ListTile(
          title: Text('Toast用法'),
          onTap: () {
            _showToast();
          },
        ),
        ListTile(
          title: Text('自定义dialog'),
          onTap: () {
            _showCustomerDialog();
          },
        ),
      ],
    );
  }

// 自定义dialog
  void _showCustomerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return CustomerDialog('关于我们', content:'司法鉴定金发科技啊哈交互附近寒风就按');
      },
    );
  }
}
