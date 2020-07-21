import 'package:flutter/material.dart';
import 'package:startup_namer/listData.dart';

class PageDataTableView extends StatefulWidget {
  PageDataTableView({Key key}) : super(key: key);

  @override
  _PageDataTableViewState createState() => _PageDataTableViewState();
}

class _PageDataTableViewState extends State<PageDataTableView> {
  int _sortCloumnIndex = 0;

  bool _sortAscending = true;

  final PostDataSource _postDataSource = PostDataSource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTable'),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('ddd'),

              rowsPerPage: 5, //每页行数

              sortColumnIndex: _sortCloumnIndex, //按第几个栏中的值排序
              sortAscending: _sortAscending, //升降序排列
              columns: [
                DataColumn(
                  label: Text('title'),
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      _sortCloumnIndex = columnIndex;
                      _sortAscending = ascending;
                      print(columnIndex);

                      _postDataSource._sort(
                          (post) => post.title.length, ascending);
                    });
                  },
                ),
                DataColumn(label: Text('author')),
                DataColumn(label: Text('Image'))
              ],
              source: _postDataSource,
            )
          ],
        ),
      ),
    );
  }
}

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;

  int _selectCount = 0;

  @override
  DataRow getRow(int index) {
    final e = _posts[index];
    return DataRow(cells: [
      DataCell(Text(e.title)),
      DataCell(Text(e.author)),
      DataCell(Image.network(e.image)),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _posts.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectCount;

  void _sort(getField(Post post), bool ascending) {
    _posts.sort((a, b) {
      if ((!ascending)) {
        final c = a;
        a = b;
        b = c;
      }

      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });

    notifyListeners();
  }
}
