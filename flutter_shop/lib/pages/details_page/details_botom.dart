import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/cart_model.dart';
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
          InkWell(
            child: Container(
              width: ScreenUtil().setWidth(110),
              alignment: Alignment.center,
              child: Icon(Icons.shopping_cart, color: Colors.red, size: 35),
            ),
            onTap: () {},
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
