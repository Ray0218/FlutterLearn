import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/model/cart_model.dart';

class CartItem extends StatelessWidget {
  final CartInfoModel item;
  const CartItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      child: Row(
        children: <Widget>[_cartChatBt(), _cartImage(), _cartName(),_cartPrice()],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black26))),
    );
  }

  Widget _cartChatBt() {
    return Container(
      child: Checkbox(
        value: true,
        onChanged: (value) {},
      ),
    );
  }

  Widget _cartImage() {
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black26))),
      child: Image.network(item.images),
    );
  }

  Widget _cartName() {
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black26))),
      child: Column(
        children: <Widget>[Text(item.goodsName)],
      ),
    );
  }

  Widget _cartPrice() {
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black26))),
      child: Column(

        children: <Widget>[

    

          Text('¥ ${item.price}'),

          IconButton(icon: Icon(Icons.delete_forever),iconSize: 30, onPressed: (){})
        ],
      ),
    );
  }
}
