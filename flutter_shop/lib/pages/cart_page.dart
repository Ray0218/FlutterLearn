import 'package:flutter/material.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_shop/pages/cart_page/cart_bottom.dart';
import 'package:provide/provide.dart';
import '../provide/cart_provide.dart';
import 'cart_page/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('购物车'),
          elevation: 0,
        ),
        body: Provide<CartProvide>(
          builder: (context, child, value) {
            List<CartInfoModel> modelList = value.cartModelList;

            print('购物车数据');

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

           Positioned(child:  CartBottom(),
           bottom: 0,
           )
              ],
            );
          },
        )

        //  FutureBuilder(
        //   future: _getCartInfo(context),
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     print('DDDDDD');
        //     if (snapshot.hasData) {
        //       // Provide.value<CartProvide>(context).getLocalCArtModels();
        //       List<CartInfoModel> modelList =
        //           Provide.value<CartProvide>(context).cartModelList;

        //       print('购物车数据');

        //       return ListView.builder(
        //         itemCount: modelList.length,
        //         itemBuilder: (BuildContext context, int index) {
        //           return CartItem(
        //             item: modelList[index],
        //           );
        //         },
        //       );
        //     } else {
        //       return Text('加载中...');
        //     }
        //   },
        // ),
        );
  }

  // Future _getCartInfo(BuildContext context) async {
  //   await Provide.value<CartProvide>(context).getLocalCArtModels();

  //   return '请求本地完成';
  // }
}
