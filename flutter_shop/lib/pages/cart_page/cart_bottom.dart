import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'package:provide/provide.dart';

class CartBottom extends StatelessWidget {
  const CartBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      height: ScreenUtil().setHeight(120),
      color: Colors.white,
      child: Provide<CartProvide>(
        builder: (context, child, value) {
          return Row(
            children: <Widget>[
              _selectAllBtn(context,value.isAllCheck),
              _appPriceArea(value.allPrice),
              _goButton(value.allCount)
            ],
          );
        },
      ),
    );
  }

  Widget _selectAllBtn(BuildContext context,isSelect ) {
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
              value: isSelect,
              onChanged: (value) {
                Provide.value<CartProvide>(context).checkall(!isSelect);
              }),
          Text('全选')
        ],
      ),
    );
  }

  Widget _appPriceArea(double appPrice) {
    return Container(
      width: ScreenUtil().setWidth(380),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '合计',
                style: TextStyle(
                    color: Colors.black54, fontSize: ScreenUtil().setSp(34)),
              ),
              SizedBox(width: 5),
              Text(
                '¥:$appPrice',
                style: TextStyle(
                    color: Colors.red, fontSize: ScreenUtil().setSp(36)),
              )
            ],
          ),
          Text(
            '满10元免配送费,预约购买免配送费',
            style: TextStyle(
                color: Colors.black, fontSize: ScreenUtil().setSp(22)),
          )
        ],
      ),
    );
  }

  Widget _goButton(int count) {
    return Container(
      width: ScreenUtil().setWidth(200),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        child: Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(3.0)),
            child: Text(
              '结算($count)',
              style: TextStyle(
                color: Colors.white,
              ),
            )),
        onTap: () {},
      ),
    );
  }
}
