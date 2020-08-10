import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/klimage.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'package:provide/provide.dart';
import 'cart_count.dart';

class CartItem extends StatelessWidget {
  final CartInfoModel item;
  const CartItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      child: Row(
        children: <Widget>[
          _cartChatBt(context),
          _cartImage(),
          _cartName(),
          _cartPrice(context)
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black26))),
    );
  }

  Widget _cartChatBt(BuildContext context) {
    return Container(
      child: Checkbox(
        value: item.isCheck,
        onChanged: (value) {
          Provide.value<CartProvide>(context).changeCheckStatus(item.goodsId);
        },
      ),
    );
  }

  Widget _cartImage() {
    print(item.images);
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.0, color: Colors.black26)),
      child: Image.network(
        
        kltransImages(item.images)

          ),
    );
  }

  Widget _cartName() {
    return Container(
      width: ScreenUtil().setWidth(290),
      // padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(left: 8.0),

      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     border:
      //         Border(bottom: BorderSide(width: 1.0, color: Colors.black26))),
      child: Column(
        children: <Widget>[
          Text(item.goodsName),
          CartCount(
            itemModel: item,
          )
        ],
      ),
    );
  }

  Widget _cartPrice(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(10.0),
      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     border:
      //         Border(bottom: BorderSide(width: 1.0, color: Colors.black26))),
      child: Column(
        children: <Widget>[
          Text('¥ ${item.price}'),
          IconButton(
              icon: Icon(Icons.delete_forever),
              iconSize: 30,
              onPressed: () {
                Provide.value<CartProvide>(context).deleteGoods(item.goodsId);
              })
        ],
      ),
    );
  }
}
