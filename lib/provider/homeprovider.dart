import 'package:flutter/material.dart';
import 'package:hooker_cooker/mock/mockdata.dart';

class HomeProvider extends ChangeNotifier {
  // Ovqatlar ro'yxati
  final List<dynamic> _ovqatlar = OvqatMock.mockOvqatlar;
  List<dynamic> get ovqatlar => _ovqatlar;

  // Yurakchani bosganda
  void toggleFavorite(int index) {
    _ovqatlar[index].yurak = !_ovqatlar[index].yurak;
    notifyListeners();
  }

  // --- FILTR LOGIKASI ---
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
}