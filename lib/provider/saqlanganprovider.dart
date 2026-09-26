import 'package:flutter/material.dart';
import 'package:hooker_cooker/mock/mockdata.dart';

class SaqlanganProvider extends ChangeNotifier {
  // Yurak holatini o'zgartirish va ekranni yangilash
  void yurakniOzgartirish(dynamic ovqat) {
    if (ovqat != null) {
      ovqat.yurak = !ovqat.yurak;
      notifyListeners();
    }
  }

  List get favouriteList {
    return OvqatMock.mockOvqatlar
        .where((item) => item.yurak == true)
        .toList();
  }
}