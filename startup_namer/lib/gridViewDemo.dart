import 'package:flutter/material.dart';
// import 'package:startup_namer/slRandomClor.dart';
import 'package:startup_namer/listData.dart';

class GridViewBuild extends StatelessWidget {
  List<Widget> _getData() {
    var tempList = listData.map((e) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.black12,
        )),
        child: Column(
          children: <Widget>[
            Image.network(
              e['imageUrl'],
              fit: BoxFit.cover,
              // height: 60,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              e['title'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ),
            )
          ],
        ),
      );
    });

    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    return GridView.count(
      padding: EdgeInsets.all(15),
      crossAxisCount: 3, //列数
      crossAxisSpacing: 10, //列间距
      mainAxisSpacing: 15, //行间距
      childAspectRatio: 0.7,//宽度和高度的比例
      children: this._getData(),
    );
  }
}
