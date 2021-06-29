import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class KLSnackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('老孟'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              // color: Colors.pink,
              // textColor: Colors.white,
              onPressed: () {
                _displaySnackBar(context);
              },
              child: Text('show SnackBar'),
            ),
            ElevatedButton(
              // color: Colors.pink,
              // textColor: Colors.white,
              onPressed: () {
                _dispalyCuptionSheet(context);
              },
              child: Text('show CupertinoActionSheet'),
            ),
            ElevatedButton(
              onPressed: () {
                _showAlterView(context);
              },
              child: Text('show CupertinoAlertDialog'),
            ),
              ElevatedButton(
              onPressed: () {
                _showAlertDialog(context);
              },
              child: Text('show showDialog'),
            ),
              ElevatedButton(
              onPressed: () {
                showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1990), lastDate: DateTime(2025));
              },
              child: Text('show showDatePicker'),
            ),
   _cupertinoContextMenu(context)

            
          ],
        )

        // body: Builder(builder: (context){
        //    return Center(
        //     child: ElevatedButton(
        //       // color: Colors.pink,
        //       // textColor: Colors.white,
        //       onPressed: () {
        //         final snackBar = SnackBar(content: Text('老孟'));

        //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //       },
        //       // _displaySnackBar(context),
        //       child: Text('show SnackBar'),
        //     ),
        //   );
        // })

        // StatefulBuilder(
        //     builder: (BuildContext context, StateSetter setState) {
        //   return Center(
        //     child: ElevatedButton(
        //       // color: Colors.pink,
        //       // textColor: Colors.white,
        //       onPressed: () {
        //         final snackBar = SnackBar(content: Text('老孟'));

        //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //       },
        //       // _displaySnackBar(context),
        //       child: Text('show SnackBar'),
        //     ),
        //   );
        // }),
        );
  }
}

_displaySnackBar(BuildContext context) {
  final snackBar = SnackBar(content: Text('老孟'));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

_dispalyCuptionSheet(BuildContext context) async {
  await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: Text(
            '上传照片',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          message: Text('请选择上传方式'),
          actions: [
            CupertinoActionSheetAction(
              child: Text(
                "相册",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop('相册');
              },
              isDefaultAction: true,
            ),
            CupertinoActionSheetAction(
              child: Text(
                "拍照",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop('拍照');
              },
              isDestructiveAction: true,
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('取消'),
            onPressed: () {
              Navigator.of(context).pop('cancel');
            },
          ),
        );
      });
}

_showAlterView(BuildContext context) async {
  await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('提示'),
          content: Text('这个是content'),
          actions: [
            CupertinoDialogAction(
              child: Text('取消'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text('确定'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}


_showAlertDialog(BuildContext context) async {
  await showDialog( 
      context: context,
      builder: (context) {
        // return CupertinoAlertDialog(
        // 
        return AlertDialog( 
          title: Text('提示'),
          content: Text('这个是content'),
          actions: [

            TextButton( 
              child: Text('取消'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('确定'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}


Widget _cupertinoContextMenu(BuildContext context){

  return CupertinoContextMenu(
  child: Container(
    color: Colors.red,
    height: 60,
    width: 100,
    child: Center(child: Text('CupertinoContextMenu长按弹出菜单'),),
  ),
  previewBuilder: (
    BuildContext context,
    Animation<double> animation,
    Widget child,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10 * animation.value),
        color: Colors.red,
      ),
      height: 60,
      width: 100,
    );
  },
  actions: <Widget>[
    CupertinoContextMenuAction(
      child: const Text('Action one'),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    CupertinoContextMenuAction(
      child: const Text('Action two'),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ],
) ;
}
// class KLSnackDemo extends StatefulWidget {
//   KLSnackDemo({Key key}) : super(key: key);

//   @override
//   _KLSnackDemoState createState() => _KLSnackDemoState();
// }

// class _KLSnackDemoState extends State<KLSnackDemo> {
 
//   SnackBar _snack = SnackBar(
//     content: Text('内容'),

//     backgroundColor: Colors.purple,

//     elevation: 12,

//     action: SnackBarAction(label: "OK", onPressed: (){




//     }),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Builder(builder: (context) {
//         return Center(
//             child: ElevatedButton(
//                 onPressed: () {
//                   // ScaffoldMessenger.of(context).showSnackBar(_snack);
//                    _displaySnackBar(context);
//                 },
//                 // 
//                  child: Text('显示SnackBar')));
//       }),
//     );
//   }

// void _displaySnackBar(BuildContext context) {

//                   ScaffoldMessenger.of(context).showSnackBar(_snack);
  
// }

// }
