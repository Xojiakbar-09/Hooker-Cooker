import 'package:flutter/material.dart';

class TayyorlashProvider extends ChangeNotifier {
  late PageController pageController;
  int _correctPage = 0;

  int get correctPage => _correctPage;

  TayyorlashProvider() {
    pageController = PageController();
  }

  void reset() {
    _correctPage = 0;
    if (pageController.hasClients) {
      pageController.jumpToPage(0);
    }
    notifyListeners();
  }

  void onPageChanged(int index) {
    _correctPage = index;
    notifyListeners();
  }

  void nextPage(int totalSteps, BuildContext context, VoidCallback onFinish) {
    if (_correctPage < totalSteps - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      onFinish();
      reset(); 
    }
  }

  void previousPage(BuildContext context) {
    if (_correctPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      reset(); 
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}