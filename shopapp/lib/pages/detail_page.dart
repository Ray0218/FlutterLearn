import 'package:flutter/material.dart';
import 'package:shopapp/provide/details_info.dart';
import 'package:provide/provide.dart';
import 'details_page/detail_top_area.dart';
import 'details_page/detail_explain.dart';
import '../provide/details_info.dart';
import 'details_page/detail_web.dart';
import 'details_page/details_botom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 
class DetailPage extends StatelessWidget {
  final String goodsId;
  const DetailPage({Key key, this.goodsId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _getDetailInfo(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('商品详情'),
      ),
      body: DefaultTabController(
          length: 2,
          child: FutureBuilder(
            future: _getDetailInfo(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return DetailBody();
              } else {
                return Center(
                  child: Text('加载中...'),
                );
              }
            },
          )),
    );
  }

  Future _getDetailInfo(BuildContext context) async {
    await Provide.value<DetailInfoProvide>(context).getGoodsInfo(goodsId);

    print('加载完成.....');

    return 'ddd';
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(

          padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(120) ),
          child: ListView(
            children: <Widget>[
              DetailTopArea(),
              DetailExplain(),
              // DetailTabBar(),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 10.0),
                child: TabBar(
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.black54,
                    onTap: (value) {
                      print('点击 $value');

                      Provide.value<DetailInfoProvide>(context)
                          .changeTabSlect(
                              value == 0 ? true : false);
                    },
                    labelPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    tabs: [Text('详情'), Text('评论')]),
              ),

              DetailWeb()
            ],
          ),
        ),
        Positioned(
          child: DetailBottom(),
          bottom: 0,
        )
      ],
    );
  }
}
