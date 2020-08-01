import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  RecordPage({Key key}) : super(key: key);

  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  List<DataModel> _dataList = [
    DataModel('Draw', subTitle: '抽屉', isFavourite: true),
    DataModel('Draw', subTitle: '抽屉', isFavourite: false),
    DataModel('Draw', subTitle: '抽屉', isFavourite: false),
    DataModel('Draw', subTitle: '抽屉', isFavourite: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: _dataList.length,
          itemBuilder: (context, index) {
            return _displayListView(index);
          }),
    );
  }

  Widget _displayListView(int index) {
    return Card(
        elevation: 1.5,
        margin: EdgeInsets.only(top: 3, left: 10, right: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        child: ListTile(
          title: Text(_dataList[index].title,style: TextStyle(color: Colors.black),),
          subtitle: Text(_dataList[index].subTitle),
          trailing: Icon(
            _dataList[index].isFavourite ? Icons.star : Icons.star_border,
            color: _dataList[index].isFavourite ? Colors.yellow : Colors.black,
            size: 28,
          ),
          onTap: () {
            setState(() {
              _dataList[index].isFavourite = !_dataList[index].isFavourite;
            });
          },
        ));
  }
}

class DataModel {
  String title;
  String subTitle;
  bool isFavourite;

  DataModel(this.title, {this.subTitle, this.isFavourite});
}
