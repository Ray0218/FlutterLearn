import 'package:flutter/material.dart';
import 'package:shopapp/config/service_url.dart';

import '../model/detail_model.dart';
import '../service/service_method.dart';

class DetailInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo;

  bool rSelectLeft = true;
  bool rSelectRight = false;

  //tab的切换
  changeTabSlect(bool isLeft) {
    rSelectLeft = isLeft;
    rSelectRight = !isLeft;

    notifyListeners();
  }

//从后台获取数据
  getGoodsInfo(String id) async {
    var formData = {'goodId': id};

    await requestData(serviePath['getGoodDetailById'], formdata: formData)
        .then((value) {
      // print('######## 商品详情 #######');
      // print(json.encode(value));
      goodsInfo = DetailsModel.fromJson(value);
      notifyListeners();
    });
  }
}
