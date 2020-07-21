import 'package:flutter/material.dart';
import 'package:startup_namer/slRandomClor.dart';

class ChipDemo extends StatefulWidget {
  ChipDemo({Key key}) : super(key: key);

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List titeStr = ['apple', 'orange', 'banana', 'lemon', 'bear'];

  List<String> _selectStr = [];
  String actionStr = 'nothing';
  String choiceStr = 'apple';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chipDemo'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text('重置'),
          onPressed: () {
            setState(() {
              titeStr = ['apple', 'orange', 'banana', 'lemon', 'bear'];
              _selectStr = [];
            });
          }),
      body: ListView(
        children: <Widget>[
          ChipView(),
          Divider(
            color: Colors.black,
          ),
          Wrap(
            spacing: 5,
            children: titeStr.map((e) {
              return Chip(
                label: Text(e),
                onDeleted: () {
                  setState(() {
                    titeStr.remove(e);
                  });
                },
              );
            }).toList(),
          ),
          Divider(
            color: Colors.black,
          ),
          Text('Actionchip: ${this.actionStr}'),
          ActionChipView(
            titeStr: this.titeStr,
            actionCallBack: () {
              setState(() {
                this.actionStr = 'd ';
              });
            },
          ),
          Divider(
            color: Colors.black,
          ),
          Text('FilterChip: ${this.actionStr}'),
          Wrap(
            spacing: 6,
            children: titeStr.map((e) {
              return FilterChip(
                label: Text(e),
                selected: _selectStr.contains(e),
                onSelected: (value) {
                  setState(() {
                    if (!value) {
                      _selectStr.remove(e);
                    } else {
                      _selectStr.add(e);
                    }
                  });
                },
              );
            }).toList(),
          ),
          Divider(
            color: Colors.black,
          ),
          Text('ChoiceChip: ${this.actionStr}'),
          Wrap(
            spacing: 6,
            children: titeStr.map((e) {
              return ChoiceChip(
                label: Text(e),
                selectedColor: Colors.orange[50],
                selected: choiceStr == e,
                onSelected: (value) {
                  setState(() {
                    choiceStr = e;
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ActionChipView extends StatelessWidget {
  final List titeStr;

  final VoidCallback actionCallBack;

  const ActionChipView({Key key, this.titeStr, this.actionCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      children: titeStr.map((e) {
        return ActionChip(label: Text(e), onPressed: this.actionCallBack);
      }).toList(),
    );
  }
}

class ChipView extends StatelessWidget {
  const ChipView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 1, //行间距
      children: <Widget>[
        Chip(
          label: Text('chip单独普通'),
          backgroundColor: slRandomColor(),
        ),
        Chip(
          label: Text('chip带有文字'),
          avatar: CircleAvatar(
            child: Text('AA'),
            backgroundColor: slRandomColor(),
          ),
        ),
        Chip(
          label: Text('chip带有删除'),
          deleteButtonTooltipMessage: '删除提示',
          onDeleted: () {},
          avatar: CircleAvatar(
            child: Text('AA'),
            backgroundColor: slRandomColor(),
          ),
        ),
        Chip(
          label: Text('chip带有图片'),
          avatar: CircleAvatar(
            // child: Text('AA'),
            backgroundImage: NetworkImage(
                'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2905678561,227122043&fm=26&gp=0.jpg'),
            backgroundColor: slRandomColor(),
          ),
        ),
      ],
    );
  }
}
