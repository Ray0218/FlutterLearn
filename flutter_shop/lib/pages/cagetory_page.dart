import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/model/categoryModel.dart';
import 'package:provide/provide.dart';
import '../provide/child_category.dart';
import '../model/category_list_demo.dart';
import '../service/service_method.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../routes/application.dart';


class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryView(),
            Column(
              children: <Widget>[RightCategoryView(), CategoryGoodsList()],
            )
          ],
        ),
      ),
    );
  }
}

class LeftCategoryView extends StatefulWidget {
  LeftCategoryView({Key key}) : super(key: key);

  @override
  _LeftCategoryViewState createState() => _LeftCategoryViewState();
}

class _LeftCategoryViewState extends State<LeftCategoryView> {
  List<Data> parentModels = [];

  int rselectIndex = 0;

  @override
  void initState() {
    super.initState();
    _getCategoryData();
    _getCategoryListData('4');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(200),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1.0, color: Colors.black12))),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
          );
        },
        itemCount: parentModels.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            selected: rselectIndex == index,
            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            title: Text(parentModels[index].mallCategoryName,
                style: TextStyle(fontSize: ScreenUtil().setSp(28))),
            onTap: () {
              var childList = parentModels[index].bxMallSubDto;

              Provide.value<ChildCategory>(context).setChildListData(childList);

              Provide.value<CagegoryListProvide>(context)
                  .changeCategoryId(parentModels[index].mallCategoryId);

              _getCategoryListData(parentModels[index].mallCategoryId);

              setState(() {
                rselectIndex = index;
              });
            },
          );
        },
      ),
    );
  }

  void _getCategoryData() {
    requestData(serviePath['getCategory']).then((value) {
      CategoryModel categoryM = CategoryModel.fromJson(value);

      setState(() {
        parentModels.addAll(categoryM.data);
      });

      if (categoryM.data.length != 0) {
        var childList = parentModels[0].bxMallSubDto;

        Provide.value<ChildCategory>(context).setChildListData(childList);
      }
    });
  }

  void _getCategoryListData(String cagegoryId) {
    var data = {'categoryId': cagegoryId, 'categorySubId': "", 'page': 1};

    requestData(serviePath['getMallGoods'], formdata: data).then((value) {
      CategoryListModel categoryM = CategoryListModel.fromJson(value);

      Provide.value<CagegoryListProvide>(context)
          .setChildListData(categoryM.data);
    });
  }
}

class RightCategoryView extends StatefulWidget {
  RightCategoryView({Key key}) : super(key: key);

  @override
  _RightCategoryViewState createState() => _RightCategoryViewState();
}

class _RightCategoryViewState extends State<RightCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(750 - 200),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26, width: 1))),
      child: Provide<ChildCategory>(builder: (context, child, childList) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: childList.rChildList.length,
          itemBuilder: (BuildContext context, int index) {
            return FlatButton(
              onPressed: () {
                setState(() {
                  Provide.value<CagegoryListProvide>(context)
                      .changeTypeIndex(index);
                });

                _getCategoryListData(childList.rChildList[index].mallSubId);
              },
              child: Text(childList.rChildList[index].mallSubName),

              textColor: index ==
                      Provide.value<CagegoryListProvide>(context).rTypeIndex
                  ? Colors.red
                  : Colors.black,
              // padding: EdgeInsets.zero,
              // color: slRandomColor(),
            );
          },
        );
      }),
    );
  }

  void _getCategoryListData(String subId) {
    var data = {
      'categoryId': Provide.value<CagegoryListProvide>(context).rcategoryId,
      'categorySubId': subId,
      'page': 1
    };

    requestData(serviePath['getMallGoods'], formdata: data).then((value) {
      CategoryListModel categoryM = CategoryListModel.fromJson(value);

      if (categoryM.data == null) {
        Provide.value<CagegoryListProvide>(context).setChildListData([]);
      } else {
        Provide.value<CagegoryListProvide>(context)
            .setChildListData(categoryM.data);
      }
    });
  }
}

class CategoryGoodsList extends StatefulWidget {
  CategoryGoodsList({Key key}) : super(key: key);

  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  var rScrollerController = ScrollController();

  @override
  Widget build(BuildContext context) {
   return Expanded(
        child: Container(
      width: ScreenUtil().setWidth(750 - 200),
      child: Provide<CagegoryListProvide>(builder: (context, chiild, provide) {
        try {
          if (Provide.value<CagegoryListProvide>(context).rPage == 1) {
            print('当前是第一页');
            rScrollerController.jumpTo(0.0); //返回到顶部
          }
        } catch (e) {
          print('进入页面第一次初始化 $e');
        }

        if (provide.rChildList.length > 0) {
          return ListView.builder(
            controller: rScrollerController,
            itemCount: provide.rChildList.length,
            itemBuilder: (BuildContext context, int index) {
              return _listWidget(index, provide.rChildList);
            },
          );
        } else {
          return Center(
            child: Text('暂无数据'),
          );
        }
      }),
    ));
  }

  Widget _listWidget(int index, List<CategoryListData> rDataList) {
    return InkWell(

      onTap: () {
                    Appslication.router.navigateTo(context, '/detail?id=${rDataList[index].goodsId}');

      },
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black26, width: 1.0))),
        child: Row(
          children: <Widget>[
            _goodsImage(index, rDataList),
            Column(
              children: <Widget>[
                _goodsName(index, rDataList),
                _goodsPrice(index, rDataList)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _goodsImage(int index, List<CategoryListData> rDataList) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(rDataList[index].image),
    );
  }

  Widget _goodsName(int index, List<CategoryListData> rDataList) {
    return Container(
      padding: EdgeInsets.all(5),
      width: ScreenUtil().setWidth(250),
      child: Text(
        rDataList[index].goodsName,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _goodsPrice(int index, List<CategoryListData> rDataList) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Text(
            '价格 ${rDataList[index].presentPrice}',
            style:
                TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30)),
          ),
          Text(
            '价格 ${rDataList[index].oriPrice}',
            style: TextStyle(
                color: Colors.black26,
                fontSize: ScreenUtil().setSp(30),
                decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }
}
