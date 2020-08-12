import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/klimage.dart';
import 'package:shopapp/model/detail_model.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';

class DetailTopArea extends StatelessWidget {
  const DetailTopArea({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<DetailInfoProvide>(
      builder: (context, child, value) {
        GoodInfo goodsInfo = value.goodsInfo.data.goodInfo;

        if (goodsInfo != null) {
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _goodsImage(goodsInfo.image1),
                _goodsName(goodsInfo.goodsName),
                _goodNum(goodsInfo.goodsSerialNumber),
                _goodPrice(goodsInfo.presentPrice.toString(),
                    goodsInfo.oriPrice.toString())
              ],
            ),
          );
        } else {
          return Text('加载中...');
        }
      },
    );
  }

  Widget _goodsImage(url) {
    return klImage(url, width: ScreenUtil().setWidth(740),height: ScreenUtil().setHeight(750));

    // Image.network(
    //   url,
    //   width: ScreenUtil().setWidth(740),
    // );
  }

  Widget _goodsName(String name) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        style: TextStyle(fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }

  Widget _goodNum(String num) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        '编号: $num',
        style:
            TextStyle(color: Colors.black45, fontSize: ScreenUtil().setSp(26)),
      ),
    );
  }

  Widget _goodPrice(String price, String nowPrice) {
    var screenUtil = ScreenUtil();
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          Text(
            '¥ $price',
            style: TextStyle(color: Colors.red, fontSize: screenUtil.setSp(30)),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            '市场价',
            style: TextStyle(
                color: Colors.black45, fontSize: screenUtil.setSp(30)),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '¥ $nowPrice',
            style: TextStyle(
                color: Colors.black38,
                fontSize: screenUtil.setSp(30),
                decoration: TextDecoration.lineThrough),
          )
        ],
      ),
    );
  }
}
