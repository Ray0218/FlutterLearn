import 'package:flutter/material.dart';
import '../listData.dart';

class DataTableView extends StatefulWidget {
  DataTableView({Key key}) : super(key: key);

  @override
  _DataTableViewState createState() => _DataTableViewState();
}

class _DataTableViewState extends State<DataTableView> {
  int _sortCloumnIndex = 0;

  bool _sortAscending = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
      ),
      body: ListView(
        children: <Widget>[
          DataTable(
              sortColumnIndex: _sortCloumnIndex, //按第几个栏中的值排序
              sortAscending: _sortAscending, //升降序排列
              // onSelectAll: (value) {
              //   //全选状态订制
              //    print('########' + value.toString());
              // },
              columns: [
                DataColumn(
                  label: Text('title'),
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      _sortCloumnIndex = columnIndex;
                      _sortAscending = ascending;
                      print(columnIndex);
                      posts.sort((a, b) {
                        if (!ascending) {
                          final c = a;
                          a = b;
                          b = c;
                        }

                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  },
                ),
                DataColumn(label: Text('author')),
                DataColumn(label: Text('Image'))
              ],
              rows: posts.map((e) {
                return DataRow(
                    selected: e.selected,
                    onSelectChanged: (value) {
                      setState(() {
                        if (e.selected != value) {
                          e.selected = value;
                        }
                      });
                    },
                    cells: [
                      DataCell(Text(e.title)),
                      DataCell(Text(e.author)),
                      DataCell(Image.network(e.image)),
                    ]);
              }).toList())
        ],
      ),
    );
  }
}
