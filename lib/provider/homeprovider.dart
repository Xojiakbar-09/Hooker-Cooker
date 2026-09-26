import 'package:flutter/material.dart';
import 'package:hooker_cooker/mock/mockdata.dart';

class HomeProvider extends ChangeNotifier {
  final List<dynamic> _ovqatlar = OvqatMock.mockOvqatlar;
  List<dynamic> get ovqatlar => _ovqatlar;

  void toggleFavorite(int index) {
    _ovqatlar[index].yurak = !_ovqatlar[index].yurak;
    notifyListeners();
  }

  final List<String> filter = [
    'Barchasi',
    'Milliy taomlar',
    'Desertlar',
    "Sho'rvalar",
  ];

  int _filterIndex = 0;
  int get filterIndex => _filterIndex;

  void changeFilter(int index) {
    _filterIndex = index;
    notifyListeners();
  }

  void pickFileFromFolder({required void Function() onSuccess}) {}

  void pickimagecamera({required void Function() onSuccess}) {}

  void pickimage({required void Function() onSuccess}) {}
}