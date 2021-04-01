import 'package:flutter/material.dart';

class KLSnackDemo extends StatefulWidget {
  KLSnackDemo({Key key}) : super(key: key);

  @override
  _KLSnackDemoState createState() => _KLSnackDemoState();
}

class _KLSnackDemoState extends State<KLSnackDemo> {
 
  SnackBar _snack = SnackBar(
    content: Text('内容'),

    backgroundColor: Colors.purple,

    elevation: 12,

    action: SnackBarAction(label: "OK", onPressed: (){




    }),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(builder: (context) {
        return Center(
            child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(_snack);
                },
                child: Text('显示SnackBar')));
      }),
    );
  }
}
