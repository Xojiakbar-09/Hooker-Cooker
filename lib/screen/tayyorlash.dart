import 'package:flutter/material.dart';
import 'package:hooker_cooker/provider/tayyorlash.dart';
import 'package:provider/provider.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/screen/mainscrren.dart';
import 'package:hooker_cooker/widget/taymer.dart';
import 'package:hooker_cooker/widget/tayorqadam.dart';
import 'package:hooker_cooker/widget/tayyorlashappbar.dart';
import 'package:hooker_cooker/widget/tugaganda.dart';
// TayyorlashProvider faylini import qilasiz:
// import 'tayyorlash_provider.dart';

class Tayyorlash extends StatelessWidget {
  final dynamic model;
  const Tayyorlash({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    // Provider'ni chaqirib olamiz
    final provider = context.watch<TayyorlashProvider>();
    final List qadamlarList = model?.qadamlar ?? [];

    return Scaffold(
      backgroundColor: Cols.dark,
      appBar: const Tayyorlashappbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Tayorqadam(
              currentStep: provider.correctPage + 1,
              totalSteps: qadamlarList.isEmpty ? 1 : qadamlarList.length,
              stepTitle: "JARAYON",
            ),

            const SizedBox(height: 51),

            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: provider.pageController,
                itemCount: qadamlarList.length,
                onPageChanged: (int index) {
                  provider.onPageChanged(index);
                },
                itemBuilder: (context, index) {
                  return Taymer(
                    qadamMatni: qadamlarList[index].toString(),
                    tugaganda: () {
                      provider.nextPage(qadamlarList.length, context, () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Tugaganda(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      });
                    },
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      provider.previousPage(context);
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
                      provider.correctPage == 0 ? 'Chiqish' : 'Oldingi qadam',
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      provider.nextPage(qadamlarList.length, context, () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                          (Route<dynamic> route) => false,
                        );
                      });
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
                      provider.correctPage == qadamlarList.length - 1
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
