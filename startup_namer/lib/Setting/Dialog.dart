 
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:startup_namer/slRandomClor.dart';
import 'CustomerDialog.dart';

enum OptionValues { A, B, C }

class DialogView extends StatefulWidget {
  DialogView({Key key}) : super(key: key);

  @override
  _DialogViewState createState() => _DialogViewState();
}

class _DialogViewState extends State<DialogView> {
  String dialogSelectStr = ' ';

  Future _showAlterDialog() async {
    var result = await showDialog(
      //打开对话框
      barrierDismissible: false, //点击空白可以关闭
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

    if (result == '确定') {
      setState(() {
        dialogSelectStr = '确定';
      });
    } else {
      setState(() {
        dialogSelectStr = '取消';
      });
    }

    print(result);
  }

  String simpleSeleString = ' ';

  Future _showSimpleDialog() async {
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

                Navigator.pop(context, OptionValues.A);
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('Option B'),
              onPressed: () {
                print('Option B');
                Navigator.pop(context, OptionValues.B);
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('Option C'),
              onPressed: () {
                print('Option C');
                Navigator.pop(context, OptionValues.C);
              },
            )
          ],
        );
      },
    );

    switch (result) {
      case OptionValues.A:
        setState(() {
          simpleSeleString = '选择了A';
        });
        break;

      case OptionValues.B:
        setState(() {
          simpleSeleString = '选择了B';
        });
        break;

      case OptionValues.C:
        setState(() {
          simpleSeleString = '选择了C';
        });
        break;
      default:
    }

    print(result);
  }

  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();
  void _showBottomSheet() {
    _bottomSheetScaffoldKey.currentState.showBottomSheet((context) {
      return BottomAppBar(
        child: Container(
          height: 90,
          width: double.infinity,
          color: slRandomColor(),
          padding: EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(
                width: 16,
              ),
              Text('测试'),
              Expanded(
                child: Text('我是放在expand中', textAlign: TextAlign.right),
              )
            ],
          ),
        ),
      );
    });
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
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      body: ListView(
         children: <Widget>[
          ListTile(
            title: Text('AlertDialog的用法: ${this.dialogSelectStr}'),
            onTap: () {
              _showAlterDialog();
            },
          ),
          ListTile(
            title: Text('SimpleDialog的用法: ${this.simpleSeleString}'),
            onTap: () {
              _showSimpleDialog();
              print('_showSimpleDialog');
            },
          ),
          ListTile(
            title: Text('_showBottomSheet用法'),
            onTap: () {
              _showBottomSheet();
            },
          ),
          ListTile(
            title: Text('_showModelBottomSheet用法'),
            onTap: () {
              _showModelBottomSheet();
            },
          ),
          ListTile(
            title: Text('_SnackBar用法'),
            onTap: () {
              _showSnackBar();
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
      ),
    );
  }

// 自定义dialog
  void _showCustomerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return CustomerDialog('关于我们', content: '司法鉴定金发科技啊哈交互附近寒风就按');
      },
    );
  }

  void _showSnackBar() {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('加载中...'),
      action: SnackBarAction(label: 'OK', onPressed: () {}),
    ));
  }

   
}



 