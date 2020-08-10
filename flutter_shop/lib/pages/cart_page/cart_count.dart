import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'package:provide/provide.dart';

class CartCount extends StatelessWidget {
  final CartInfoModel itemModel;

  const CartCount({Key key, this.itemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(45.0),

      margin: EdgeInsets.only(top: 10.0),

      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.black12),
      ),

      padding: EdgeInsets.all(0),
      // height: ScreenUtil().setHeight(45.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_decodeBtn(context), _countNum(), _addBtn(context)],
      ),
    );
  }

  Widget _decodeBtn(BuildContext context) {
    return Expanded(
        flex: 2,
        child: IconButton(
          padding: EdgeInsets.all(0.0),
          onPressed: () {
            print('dd');

            if (itemModel.count > 1) {
              Provide.value<CartProvide>(context)
                  .changeGoodCount(itemModel.goodsId, -1, true);
            }
          },
          icon: Icon(Icons.remove),
          iconSize: 20,
        ));
  }

  Widget _addBtn(BuildContext context) {
    return Expanded(
        flex: 2,
        child: IconButton(
          padding: EdgeInsets.all(0.0),
          onPressed: () {
            Provide.value<CartProvide>(context)
                .changeGoodCount(itemModel.goodsId, 1, true);
          },
          icon: Icon(
            Icons.add,
            color: Colors.red,
          ),
          iconSize: 20,
        ));
  }

  Widget _countNum() {
    return Expanded(
        flex: 3,
        child: Container(
          // width: ScreenUtil().setWidth(70),
          height: ScreenUtil().setHeight(45.0),
          margin: EdgeInsets.all(0.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: Colors.black12, width: 1.0),
                  right: BorderSide(color: Colors.black12, width: 1.0))),

          child: Text('${itemModel.count}'),
        ));
  }
}
