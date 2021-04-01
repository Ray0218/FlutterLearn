import 'package:flutter/material.dart';

import '../model/categoryModel.dart';
import '../model/category_list_demo.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> rChildList = [];

  setChildListData(List<BxMallSubDto> list) {
    BxMallSubDto all = BxMallSubDto();
    all.mallSubName = '全部';
    all.mallCategoryId = '00';
    all.comments = 'null';
    all.mallSubId = '';

    rChildList.clear();
    rChildList.add(all);
    rChildList.addAll(list);

    notifyListeners();
  }
}

class CagegoryListProvide with ChangeNotifier {
  List<CategoryListData> rChildList = [];

  String rcategoryId;

  int rTypeIndex = 0;

  int rPage = 1;

  setChildListData(List<CategoryListData> list) {
    rTypeIndex = 0;
    rChildList.clear();
    rChildList.addAll(list);

    notifyListeners();
  }

//修改分类筛选
  changeCategoryId(String categoryId) {
    rcategoryId = categoryId;
    // notifyListeners();
  }

  changeTypeIndex(int index) {
    rTypeIndex = index;
    notifyListeners();
  }

  addPage() {
    rPage++;
    notifyListeners();
  }

  resetBaseData() {
    rPage = 1;
    
  }
}
