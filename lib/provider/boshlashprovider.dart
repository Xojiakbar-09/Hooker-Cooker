import 'package:flutter/material.dart';

class BoshlashProvider extends ChangeNotifier {
  // 1. Videocont uchun yurak holati
  void yurakniBoshqarish(dynamic model) {
    if (model != null) {
      model.yurak = !model.yurak;
      notifyListeners();
    }
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeTab(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void toggleCheck(dynamic item) {
    if (item != null) {
      item.isChecked = !item.isChecked;
      notifyListeners();
    }
  }
}