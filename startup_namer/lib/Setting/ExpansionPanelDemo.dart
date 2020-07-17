import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  ExpansionPanelDemo({Key key}) : super(key: key);

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<ExpansionPanelItem> _expandItems;

  @override
  void initState() {
    super.initState();
    _expandItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
          'Panel A',
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Text('choose A'),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text('choose B'),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text('choose C'),
              ),
            ],
          ),
          false),
      ExpansionPanelItem(
          'Panel B',
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Text('choose A'),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text('choose B'),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text('choose C'),
              ),
            ],
          ),
          false),
      ExpansionPanelItem(
          'Panel C',
          Container(
            padding: EdgeInsets.all(16),
            child: Text('choose C'),
          ),
          false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                _expandItems[panelIndex].isExpand = !isExpanded;
              });
            },
            children: _expandItems.map((e) {
              return ExpansionPanel(
                body: e.body,
                isExpanded: e.isExpand,
                headerBuilder: (context, isExpand) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    child: Text(e.headerText),
                  );
                },
              );
            }).toList())
      ],
    );
  }
}

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpand;
  ExpansionPanelItem(this.headerText, this.body, this.isExpand);
}
