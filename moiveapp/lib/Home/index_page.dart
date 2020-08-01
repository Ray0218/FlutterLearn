import 'package:flutter/material.dart';

class IndexBody extends StatefulWidget {
  IndexBody({Key key}) : super(key: key);

  @override
  _IndexBodyState createState() => _IndexBodyState();
}

class _IndexBodyState extends State<IndexBody> {
  String _firstLanguage = '英语';
  String _secondLanguage = '中文(简体)';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15,right: 15),
      height: 55.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Material(
            color: Colors.white,
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  PopupMenuButton(
                    child: Text(_firstLanguage),
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(child: Text('英语')),
                        PopupMenuItem(child: Text('中文(简体)')),
                      ];
                    },

                    // child: Text(_firstLanguage),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          )),
          Material(
            child: IconButton(
                icon: Icon(Icons.compare_arrows),
                color: Colors.blue,
                onPressed: () {}),
          ),
          Expanded(
              child: Material(
            color: Colors.white,
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  PopupMenuButton(
                    child: Text(_secondLanguage),
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(child: Text('英语')),
                        PopupMenuItem(child: Text('中文(简体)')),
                      ];
                    },

                    // child: Text(_firstLanguage),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ))
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.grey[500]),
          )),
    );
  }
}
