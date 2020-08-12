import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopapp/config/service_url.dart';
import 'package:shopapp/klimage.dart';
import 'package:shopapp/service/service_method.dart';
import 'package:shopapp/slRandomClor.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../model/HomeDataModel.dart';
import '../model/home_hot_model.dart';
import '../routes/application.dart';

import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  String homePageContent = '正在请求数据';

 
  List<HotItemModel> _hotGoos = [];

  @override
  void initState() {
    super.initState();

    print('设备像素密度 : ${ScreenUtil.pixelRatio}');

    print('屏幕宽度: ${ScreenUtil.screenWidth} 屏幕高度 ${ScreenUtil.screenHeight}');
  }

  Future getHomeData() async {
    return await requestData(serviePath['homePageContent'],
        formdata: {'lon': '115.02932', 'lat': '35.76189'});
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    var formPage = {'page': 1};

    await requestData(serviePath['homePageBelowConten'], formdata: formPage)
        .then((value) {
      HomeHotModel baseModel = HomeHotModel.fromJson(value);
      print('获取结果: ${json.encode(value)}');
      _hotGoos.addAll(baseModel.data);
    });
     
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // _hotGoos.addAll(posts);
    // if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      body: FutureBuilder(
        future: getHomeData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
// 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据

              if (snapshot.hasData) {
                print('首页数据 ###');
                // print(json.encode(snapshot.data));
                HomeDataModel rBaseModel =
                    HomeDataModel.fromJson(snapshot.data);

                return SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: true,
                    header: WaterDropHeader(),
                    footer: CustomFooter(
                      builder: (BuildContext context, LoadStatus mode) {
                        Widget body;
                        if (mode == LoadStatus.idle) {
                          body = Text("pull up load");
                        } else if (mode == LoadStatus.loading) {
                          body = Center(
                            child: CupertinoActivityIndicator(),
                          );

                          // TargetPlatform.iOS
                          //               ? const CupertinoActivityIndicator()
                          //               : const CircularProgressIndicator(strokeWidth: 2.0)

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
                    child: ListView(
                      children: <Widget>[
                        SwiperBanner(bannerImages: rBaseModel.data.slides),
                        TopButtonsView(buttonsList: rBaseModel.data.category),
                        // ADBanner(),
                        RecommendView(
                            rRecommendList: rBaseModel.data.recommend),
                        FloorTitle(
                            image: rBaseModel.data.floor1Pic.pICTUREADDRESS),
                        FloorContent(rModelList: rBaseModel.data.floor1),
                        FloorTitle(
                            image: rBaseModel.data.floor2Pic.pICTUREADDRESS),
                        FloorContent(rModelList: rBaseModel.data.floor2),

                        FloorTitle(
                            image: rBaseModel.data.floor3Pic.pICTUREADDRESS),
                        FloorContent(rModelList: rBaseModel.data.floor3),

                        hotTile,
                        _hotList()
                      ],
                    ));
              } else {
                return Text('数据加载中...');
              }
            }
          } else {
            // 请求未结束，显示loading
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget hotTile = Container(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text('火爆专区'),
  );

  Widget _hotList() {
    if (_hotGoos.length != 0) {
      List<Widget> listWidget = _hotGoos.map((e) {
        return InkWell(
          onTap: () {
            print(e.image);
            Appslication.router.navigateTo(context, '/detail?id=${e.goodsId}');
          },
          child: Container(
            width: ScreenUtil().setWidth(372),
            height: 120,
            color: slRandomColor(),

            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.network(
                  kltransImages(e.image),
                ),
                Positioned(
                  child: Text(e.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: ScreenUtil().setSp(24))),
                  bottom: 30,
                ),
                Positioned(
                    bottom: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('价格 ${e.price}',
                            style: TextStyle(
                                color: Colors.black26,
                                decoration: TextDecoration.lineThrough)),
                        Text('价格 ${e.mallPrice}',
                            style: TextStyle(color: Colors.black)),
                      ],
                    )),
              ],
            ),

            // child: Column(children: <Widget>[
            //   Image.network(
            //     e.image,

            //     // fit: BoxFit.cover,
            //   ),
            //   Text(e.image,
            //       overflow: TextOverflow.ellipsis,
            //       style: TextStyle(
            //           color: Colors.pink, fontSize: ScreenUtil().setSp(24))),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: <Widget>[
            //       Text('价格 ${e.price}',
            //           style: TextStyle(
            //               color: Colors.black26,
            //               decoration: TextDecoration.lineThrough)),
            //       Text('价格 ${e.mallPrice}',
            //           style: TextStyle(color: Colors.black)),
            //     ],
            //   )
            // ]),
          ),
        );
      }).toList();

      return Wrap(
        spacing: 3,
        runSpacing: 5,
        children: listWidget,
      );
    } else {
      return Text('无数据,,,,');
    }
  }

  // void _getHotGoods() async {
  //   var formPage = {'page': _currentPage};

  //   await requestData(serviePath['homePageBelowConten'], formdata: formPage)
  //       .then((value) {
  //     HomeHotModel baseModel = HomeHotModel.fromJson(value);

  //     print('获取结果: ${json.decode(value)}');
  //     setState(() {
  //       _hotGoos.addAll(baseModel.data);
  //       _currentPage++;
  //     });
  //   });
  // }

  @override
  bool get wantKeepAlive => true;
}

class SwiperBanner extends StatelessWidget {
  final List<Slides> bannerImages;
  SwiperBanner({Key key, this.bannerImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      child: Swiper(
        itemCount: bannerImages.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: 
            klImage(bannerImages[index].image,width: ScreenUtil().setWidth(750),height: ScreenUtil().setHeight(333)),
            // Image.network(
            //   kltransImages(bannerImages[index].image),
            //   fit: BoxFit.cover,
            // ),
            onTap: () {
              Appslication.router.navigateTo(
                  context, '/detail?id=${bannerImages[index].goodsId}');
            },
          );
        },
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

class TopButtonsView extends StatelessWidget {
  final List<Category> buttonsList;
  const TopButtonsView({Key key, this.buttonsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(360),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(), //禁止滚动
        crossAxisCount: 4,
        padding: EdgeInsets.all(5),
        children: buttonsList
            .map((e) => CursomeButtons(
                  title: e.mallCategoryName,
                  image: e.image,
                ))
            .toList(),
      ),
    );
  }
}

class CursomeButtons extends StatelessWidget {
  final String title;
  final String image;
  CursomeButtons({Key key, this.title, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(image);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Image.network(
          //   kltransImages(image),
          //   width: ScreenUtil().setWidth(95),
          // ),

          klImage(image,width: ScreenUtil().setWidth(95),height: ScreenUtil().setWidth(95)),
          Text(title)
        ],
      ),
    );
  }
}

class ADBanner extends StatelessWidget {
  const ADBanner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(120),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          InkWell(
            child: Image.network(
              'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3339324092,1731840429&fm=26&gp=0.jpg',
              fit: BoxFit.fitWidth,
            ),
            onTap: () {
              print('拨打电话');

              _launchURL();
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '拨打客服电话',
              style: TextStyle(color: Colors.red, fontSize: 25),
            ),
          )
        ],
      ),
    );
  }

  void _launchURL() async {
    String url = 'tel:' + '18757194522';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'url不能进行访问';
    }
  }
}

class RecommendView extends StatelessWidget {
  final List<Recommend> rRecommendList;
  const RecommendView({Key key, this.rRecommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(400),
      child: Column(
        children: <Widget>[_titleWidget(), _recommendList(context)],
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.pink),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 2, 0, 5),
      decoration: BoxDecoration(
          color: Colors.purple,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
    );
  }

  Widget _productItem(int index, BuildContext context) {
    Recommend mode = rRecommendList[index];

    // print(kltransImages(mode.image));
    return InkWell(
      child: Container(
        child: Column(
          children: <Widget>[
            // Image.network(
            //   kltransImages(mode.image),
            //   fit: BoxFit.cover,
            // ),
            klImage(mode.image,width: 80.0,height: 80.0),
            Text(
              '价格 ${mode.price}',
              style: TextStyle(decoration: TextDecoration.lineThrough),
            ),
            Text('优惠价格 ${mode.mallPrice}'),
          ],
        ),
        height: ScreenUtil().setHeight(300),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 0.5, color: Colors.black))),
      ),
      onTap: () {
        Appslication.router.navigateTo(context, '/detail?id=${mode.goodsId}');
      },
    );
  }

  Widget _recommendList(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(340),
      child: ListView.builder(
          itemCount: rRecommendList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _productItem(index, context);
          }),
    );
  }
}

class FloorTitle extends StatelessWidget {
  final String image;
  const FloorTitle({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: slRandomColor(),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: 
        
        klImage(image,width: ScreenUtil().setWidth(750),height: ScreenUtil().setHeight(120))
        // Image.network(
        //   kltransImages(image),
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}

class FloorContent extends StatelessWidget {
  final List<Floor> rModelList;

  const FloorContent({Key key, this.rModelList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _goodsItem(rModelList[0]),
            Column(
              children: <Widget>[
                _goodsItem(rModelList[1]),
                _goodsItem(rModelList[2]),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            _goodsItem(rModelList[3]),
            _goodsItem(rModelList[4]),
          ],
        ),
      ],
    );
  }

  Widget _goodsItem(Floor goods) {
    return Container(
      width: ScreenUtil().setWidth(370),
      clipBehavior: Clip.hardEdge,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: InkWell(
        onTap: () {},
        child: Image.network(
          kltransImages(goods.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class HotGoods extends StatefulWidget {
  HotGoods({Key key}) : super(key: key);

  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('dddd'),
    );
  }
}
