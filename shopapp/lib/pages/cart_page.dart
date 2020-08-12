import 'package:flutter/material.dart';
import 'package:shopapp/model/cart_model.dart';
import 'package:shopapp/pages/cart_page/cart_bottom.dart';
import 'package:provide/provide.dart';
import '../provide/cart_provide.dart';
import 'cart_page/cart_item.dart';
 
class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _getCartInfo(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('购物车'),
          elevation: 0,
        ),
        body: Provide<CartProvide>(
          builder: (context, child, value) {
            List<CartInfoModel> modelList = value.cartModelList;

             return Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: modelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CartItem(
                      item: modelList[index],
                    );
                  },
                ),
                Positioned(
                  child: CartBottom(),
                  bottom: 0,
                )
              ],
            );
          },
        )

        //       FutureBuilder(
        //     future: _getCartInfo(context),
        //     builder: (BuildContext context, AsyncSnapshot snapshot) {
        //       if (snapshot.hasData) {
        //         // Provide.value<CartProvide>(context).getLocalCArtModels();
        //         List<CartInfoModel> modelList =
        //             Provide.value<CartProvide>(context).cartModelList;

        //         print('购物车数据 == ');

        //         print(snapshot.data);

        //         return Stack(
        //           children: <Widget>[
        //             ListView.builder(
        //               padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(120)),
        //               itemCount: modelList.length,
        //               itemBuilder: (BuildContext context, int index) {
        //                 return CartItem(
        //                   item: modelList[index],
        //                 );
        //               },
        //             ),
        //             Positioned(
        //               child: CartBottom(),
        //               bottom: 0,
        //             )
        //           ],
        //         );
        //       } else {
        //         return Text('加载中...');
        //       }
        //     },
        //   ),
        );
  }

  Future _getCartInfo(BuildContext context) async {
    await Provide.value<CartProvide>(context).getLocalCArtModels();

    return '请求本地完成';
  }
}
