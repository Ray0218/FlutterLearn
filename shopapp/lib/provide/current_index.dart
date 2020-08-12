import 'package:flutter/material.dart';

class CurrentIndexProvide with ChangeNotifier {
  int currentIndex = 0;

  changeTabIndex(int index) {
    currentIndex = index;

    notifyListeners();
  }
}
