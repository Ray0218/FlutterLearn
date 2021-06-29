import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class KLDAtaColumn extends StatefulWidget {
  KLDAtaColumn({Key key}) : super(key: key);

  @override
  _KLDAtaColumnState createState() => _KLDAtaColumnState();
}

class _KLDAtaColumnState extends State<KLDAtaColumn> {
  List<User> _rusers = [];
  var _sortAscending = true;

  @override
  void initState() {
    for (var i = 0; i < 25; i++) {
      final user =
          User('老孟$i', i * Random().nextInt(100), selected: i % 6 == 0);

      _rusers.add(user);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DataTable'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  showBottomBorder: true,
                  sortColumnIndex: 1,
                  sortAscending: _sortAscending,
                  columns: [
                    DataColumn(
                        label: Text(
                      '姓名',
                      style: TextStyle(color: Colors.red),
                    )),
                    DataColumn(
                        label: Text(
                          '年龄',
                          style: TextStyle(color: Colors.red),
                        ),
                        onSort: (index, issort) {
                          setState(() {
                            _sortAscending = issort;
                            if (issort) {
                              _rusers.sort((a, b) => a.age.compareTo(b.age));
                            } else {
                              _rusers.sort((a, b) => b.age.compareTo(a.age));
                            }
                          });
                        }),
                    DataColumn(
                        label: Text(
                      '身份证号码',
                      style: TextStyle(color: Colors.red),
                    )),
                    DataColumn(
                        label: Text(
                      '省份',
                      style: TextStyle(color: Colors.red),
                    )),
                    DataColumn(
                        label: Text(
                      '地区',
                      style: TextStyle(color: Colors.red),
                    )),
                  ],
                  rows: _rusers.map((user) {
                    return DataRow(
                        selected: user.selected,
                        onSelectChanged: (sele) {
                          setState(() {
                            user.selected = sele;
                          });
                        },
                        cells: [
                          DataCell(Text(user.name)),
                          DataCell(Text('${user.age}')),
                          DataCell(Text('${user.age}')),
                          DataCell(Text('${user.age}')),
                          DataCell(Text('ddd'),
                              showEditIcon: true,
                              placeholder: true,
                              onTap: () {})
                        ]);
                  }).toList()),
            ),
          ),
        ));
  }
}

class User {
  User(this.name, this.age, {this.selected = false});

  String name;
  int age;
  bool selected;
}
