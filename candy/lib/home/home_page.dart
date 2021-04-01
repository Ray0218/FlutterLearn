import 'package:candy/serive/request.dart';
import 'package:candy/serive/service_config.dart';
import 'package:flutter/material.dart';
import '../modes/home_list_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  int _currentPage = 1;

  void _onRefresh() async {
    // monitor network fetch

    print('begung sss ');
    _currentPage = 1;
    await afnloadData(_currentPage).then((value) {
      HomeListModel baseModel = HomeListModel.fromJson(value);

      dataArray.clear();
      dataArray.addAll(baseModel.data.modelList);

      _refreshController.refreshCompleted();

      setState(() {
        
      });
    });
  }

  void _onLoading() async {
    _currentPage += 1;
    afnloadData(_currentPage).then((value) {
      HomeListModel baseModel = HomeListModel.fromJson(value);
      dataArray.addAll(baseModel.data.modelList);
      _refreshController.loadComplete();
      setState(() {
        
      });
    });
  }

  List<UserModel> dataArray = [];

  @override
  void initState() {
    super.initState();

    print('initState');

    afnloadData(1).then((value) {
      HomeListModel baseModel = HomeListModel.fromJson(value);
      dataArray.addAll(baseModel.data.modelList);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),

      body: Container(
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(),
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = Text("pull up load");
              } else if (mode == LoadStatus.loading) {
                body = CupertinoActivityIndicator();
              } else if (mode == LoadStatus.failed) {
                body = Text("Load Failed!Click retry!");
              } else if (mode == LoadStatus.canLoading) {
                body = Text("release to load more");
              } else {
                body = Text("No more Data");
              }
              return Container(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.separated(
              itemBuilder: (context, index) {
                UserModel mode = dataArray[index];
                return HomeCell(model: mode);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1.0,
                );
              },
              itemCount: dataArray.length),
        ),
      ),
      // body: FutureBuilder(
      //   future: afnloadData(_currentPage),
      //    builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       if (snapshot.hasData) {
      //         print('####');

      //         HomeListModel baseModel = HomeListModel.fromJson(snapshot.data);

      //         print(baseModel);

      //         List<UserModel> dataArray = baseModel.data.modelList;

      //         return Container(
      //           child: SmartRefresher(
      //             enablePullDown: true,
      //             enablePullUp: true,
      //             header: WaterDropHeader(),
      //             footer: CustomFooter(
      //               builder: (BuildContext context, LoadStatus mode) {
      //                 Widget body;
      //                 if (mode == LoadStatus.idle) {
      //                   body = Text("pull up load");
      //                 } else if (mode == LoadStatus.loading) {
      //                   body = CupertinoActivityIndicator();
      //                 } else if (mode == LoadStatus.failed) {
      //                   body = Text("Load Failed!Click retry!");
      //                 } else if (mode == LoadStatus.canLoading) {
      //                   body = Text("release to load more");
      //                 } else {
      //                   body = Text("No more Data");
      //                 }
      //                 return Container(
      //                   height: 55.0,
      //                   child: Center(child: body),
      //                 );
      //               },
      //             ),
      //             controller: _refreshController,
      //             onRefresh: _onRefresh,
      //             onLoading: _onLoading,
      //             child: ListView.separated(
      //                 itemBuilder: (context, index) {
      //                   UserModel mode = dataArray[index];
      //                   return HomeCell(model: mode);
      //                 },
      //                 separatorBuilder: (context, index) {
      //                   return Divider(
      //                     height: 1.0,
      //                   );
      //                 },
      //                 itemCount: dataArray.length),
      //           ),
      //         );
      //       } else {
      //         return Center(
      //           child: Text('暂无数据'),
      //         );
      //       }
      //     } else {
      //       return Center(
      //         child: Text('加载中...'),
      //       );
      //     }
      //   },
      // ),
    );
  }

  Future afnloadData(int page) async {
    return await requestData(serviePath['homePageContent'], formdata: {
      'customerId': 6,
      'page': page,
      'pageSize': 10,
      'latitude': '120.21937542',
      'longitude': '30.25924445'
    });
  }
}

class HomeCell extends StatelessWidget {
  final UserModel model;
  const HomeCell({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [_headerImage(), _userNmae()],
      ),
    );
  }

  Widget _headerImage() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 10, 0, 15),
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(model.headimageUrl), fit: BoxFit.cover)),
    );
  }

  Widget _userNmae() {
    return Container(
      padding: EdgeInsets.only(left: 15),
      child: Text(model.nickName),
    );
  }
}
