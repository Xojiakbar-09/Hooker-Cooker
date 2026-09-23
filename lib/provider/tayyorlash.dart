import 'package:flutter/material.dart';

class TayyorlashProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  int _correctPage = 0;

  int get correctPage => _correctPage;

  // Sahifa o'zgarganda chaqiriladi
  void onPageChanged(int index) {
    _correctPage = index;
    notifyListeners();
  }

  // Keyingi qadamga o'tish
  void nextPage(int totalSteps, BuildContext context, VoidCallback onFinish) {
    if (_correctPage < totalSteps - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      onFinish();
    }
  }

  // Oldingi qadamga o'tish
  void previousPage(BuildContext context) {
    if (_correctPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}