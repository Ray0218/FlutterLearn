import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/listData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cart_model.dart';

class CartProvide with ChangeNotifier {
  String cartString = '[]';

  List<CartInfoModel> cartModelList = [];

  double allPrice = 0.0; //总价
  int allCount = 0; //商品总数

  bool isAllCheck = true; //是否全选

  getLocalCArtModels() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var temp = prefs.getStringList('localCartInfo');

    print('temp : $temp');

    if (temp == null) {
      cartModelList = [];
    } else {
      cartModelList.clear();
      temp.forEach((element) {
        CartInfoModel newModel = CartInfoModel.fromJson(json.decode(element));

        cartModelList.add(newModel);
      });
    }

    resettotalPrice();
    notifyListeners();
    // print('getLocalCArtMode/ls: ${json.encode(cartModelList)}');
  }

  resettotalPrice() {
    allCount = 0;
    allPrice = 0.0;

    isAllCheck = true;
    cartModelList.forEach((element) {
      if (element.isCheck) {
        allPrice += (element.count * element.price);
        allCount += element.count;
      } else {
        isAllCheck = false;
      }
    });
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
      newModel.isCheck = true;
      cartModelList.add(newModel);
    }

    // print('数据模型 ${json.encode(cartModelList)}');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('localCartInfo',
        cartModelList.map((e) => json.encode(e.toJson())).toList());

    resettotalPrice();
    notifyListeners();
  }

  removeCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    cartModelList.clear();
    prefs.remove('localCartInfo');

    resettotalPrice();

    notifyListeners();
  }

  deleteGoods(String goodsId) async {
    cartModelList.removeWhere((element) => element.goodsId == goodsId);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('localCartInfo',
        cartModelList.map((e) => json.encode(e.toJson())).toList());
    resettotalPrice();

    notifyListeners();
  }

  changeGoodCount(String goodId, int count, bool isPress) {
    CartInfoModel mode =
        cartModelList.firstWhere((element) => element.goodsId == goodId);

    if (isPress) {
      mode.count += count;
    } else {
      mode.count = count;
    }
    resettotalPrice();

    notifyListeners();
  }

  changeCheckStatus(String goodsId) {
    CartInfoModel mode =
        cartModelList.firstWhere((element) => element.goodsId == goodsId);
    mode.isCheck = !mode.isCheck;
    resettotalPrice();

    notifyListeners();
  }

  checkall(bool isAll) {
    cartModelList.forEach((element) {

    if (isAll) {
            element.isCheck = true;

    } else {
            element.isCheck = false;
     }
    });
    resettotalPrice();

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
