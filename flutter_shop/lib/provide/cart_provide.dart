import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/listData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cart_model.dart';

class CartProvide with ChangeNotifier {
  String cartString = '[]';

  List<CartInfoModel> cartModelList = [];
  getLocalCArtModels() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var temp = prefs.getStringList('localCartInfo');

    print('temp : $temp');

    if (temp == null) {
      cartModelList = [];
    } else {
      cartModelList.clear();
      temp.forEach((element) {
        cartModelList.add(CartInfoModel.fromJson(json.decode(element)));
      });
    }
    notifyListeners();
    // print('getLocalCArtMode/ls: ${json.encode(cartModelList)}');
  }

  saveGoods(CartInfoModel newModel) async {
    print('添加到本地数据');

    bool isHave = false;

    for (CartInfoModel element in cartModelList) {
      if (element.goodsId == newModel.goodsId) {
        element.count += 1;
        isHave = true;
        break;
      }
    }

    if (!isHave) {
      cartModelList.add(newModel);
    }

    // print('数据模型 ${json.encode(cartModelList)}');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('localCartInfo',
        cartModelList.map((e) => json.encode(e.toJson())).toList());

    notifyListeners();
  }

  removeCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    cartModelList.clear();
    prefs.remove('localCartInfo');
    notifyListeners();
  }

  // saveGoods(goodsId, goodsName, count, price, images) async {
  //   print('添加到本地数据');
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   cartString = prefs.getString('cartInfo');

  //   var temp = cartString == null ? [] : json.decode(cartString.toString());

  //   List<Map> tempList = (temp as List).cast();

  //   bool isHave = false;

  //   int ival = 0;
  //   tempList.forEach((element) {
  //     if (element['goodsId'] == goodsId) {
  //       tempList[ival]['count'] = element['count'] + 1;

  //       isHave = true;
  //     }
  //     ival++;
  //   });

  //   if (!isHave) {
  //     Map<String, dynamic> newGoods = {
  //       'goodsId': goodsId,
  //       "goodsName": goodsName,
  //       "count": count,
  //       'images': images
  //     };
  //     tempList.add(newGoods);
  //     cartModelList.add(CartInfoModel.fromJson(newGoods));

  //     cartString = json.encode(tempList).toString();
  //   }

  //   print('字符串 $cartString');

  //   print('数据模型 ${json.encode(cartModelList)}');
  //   await prefs.setString('cartInfo', cartString);

  //   notifyListeners();
  // }

  // removeCart() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   prefs.remove('cartInfo');
  //   notifyListeners();
  // }

  // getCartModelList() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   var cartString = prefs.getString('cartInfo');

  //   cartModelList = [];
  //   if (cartString != null) {
  //     List<Map> tempList = json.decode(cartString);

  //     tempList.forEach((element) {
  //       cartModelList.add(CartInfoModel.fromJson(element));
  //     });
  //   }
  //   notifyListeners();
  // }
}
