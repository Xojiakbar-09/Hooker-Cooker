import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/screen/homepage.dart';
import 'package:hooker_cooker/widget/taymer.dart';
import 'package:hooker_cooker/widget/tayorqadam.dart';
import 'package:hooker_cooker/widget/tayyorlashappbar.dart';
import 'package:hooker_cooker/widget/tugaganda.dart';

class Tayyorlash extends StatefulWidget {
  final dynamic model;
  const Tayyorlash({super.key, required this.model});

  @override
  State<Tayyorlash> createState() => _TayyorlashState();
}

class _TayyorlashState extends State<Tayyorlash> {
  final PageController _pageController = PageController();
  int correctpage = 0;

  @override
  void dispose() {
    _pageController.dispose(); // Xotirani tozalash
    super.dispose();
  }

  // Keyingi sahifaga o'tish funksiyasi
  void _nextPage(int totalSteps) {
    if (correctpage < totalSteps - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Oldingi sahifaga o'tish funksiyasi
  void _previousPage() {
    if (correctpage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List qadamlarList = widget.model?.qadamlar ?? [];

    return Scaffold(
      backgroundColor: Cols.dark,
      appBar: const Tayyorlashappbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Tayorqadam(
              currentStep: correctpage + 1,
              totalSteps: qadamlarList.isEmpty ? 1 : qadamlarList.length,
              stepTitle: "JARAYON",
            ),

            const SizedBox(height: 51),

            Expanded(
              child: PageView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // Qo'lda surishni bloklash (agar xohlasangiz ochishingiz mumkin)
                controller: _pageController,
                itemCount: qadamlarList.length,
                onPageChanged: (int index) {
                  setState(() {
                    correctpage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Taymer(
                    qadamMatni: qadamlarList[index].toString(),

                    tugaganda: () {
                      if (correctpage < qadamlarList.length - 1) {
                        _nextPage(qadamlarList.length);
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Tugaganda(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      }
                    },
                  );
                },
              ),
            ),

            // Pastki boshqaruv tugmalari
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Oldingi qadam tugmasi (chapda)
                  ElevatedButton(
                    onPressed: () {
                      if (correctpage > 0) {
                        _previousPage();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Cols.primery,
                      foregroundColor: Cols.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    child: Text(correctpage == 0 ? 'Chiqish' : 'Oldingi qadam'),
                  ),

                  // Keyingi qadam tugmasi (o'ngda)
                  ElevatedButton(
                    onPressed: () {
                      if (correctpage < qadamlarList.length - 1) {
                        _nextPage(qadamlarList.length);
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage()),
                          (Route<dynamic> route) => false,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Cols.primery,
                      foregroundColor: Cols.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    child: Text(
                      correctpage == qadamlarList.length - 1
                          ? 'Tugatish'
                          : 'Keyingi qadam',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
