import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/model/cart_model.dart';
import 'package:shopapp/provide/current_index.dart';
import 'package:provide/provide.dart';

import '../../provide/details_info.dart';
import '../../provide/cart_provide.dart';

class DetailBottom extends StatelessWidget {
  const DetailBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//获取商品信息
    var goodsInfo =
        Provide.value<DetailInfoProvide>(context).goodsInfo.data.goodInfo;

    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(120),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              InkWell(
                child: Container(
                  width: ScreenUtil().setWidth(110),
                  alignment: Alignment.center,
                  child: Icon(Icons.shopping_cart,
                      color: Colors.red[400], size: 35),
                ),
                onTap: () {
                  Provide.value<CurrentIndexProvide>(context).changeTabIndex(2);
                  Navigator.pop(context);
                },
              ),
              Provide<CartProvide>(
                builder: (context, child, value) {
                  return Positioned(
                    top: 0,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(3, 2, 3, 2),
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        '${value.allCount}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(22)),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          InkWell(
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(320),
              color: Colors.green,
              child: Text(
                '加入购物车',
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(28)),
              ),
            ),
            onTap: () async {
              Map<String, dynamic> newGoods = {
                'goodsId': goodsInfo.goodsId,
                "goodsName": goodsInfo.goodsName,
                "count": 1,
                'price': goodsInfo.presentPrice,
                'images': goodsInfo.image1
              };

              await Provide.value<CartProvide>(context)
                  .saveGoods(CartInfoModel.fromJson(newGoods));
            },
          ),
          InkWell(
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(320),
              color: Colors.red,
              child: Text(
                '立即购买',
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(28)),
              ),
            ),
            onTap: () async {
              await Provide.value<CartProvide>(context).removeCart();
            },
          )
        ],
      ),
    );
  }
}
