import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/provider/tayyorlash.dart';
import 'package:hooker_cooker/screen/mainscrren.dart';
import 'package:hooker_cooker/widget/taymer.dart';
import 'package:hooker_cooker/widget/tayorqadam.dart';
import 'package:hooker_cooker/widget/tayyorlashappbar.dart';
import 'package:provider/provider.dart';

class Tayyorlash extends StatefulWidget {
  final dynamic model;
  const Tayyorlash({super.key, required this.model});

  @override
  State<Tayyorlash> createState() => _TayyorlashState();
}

class _TayyorlashState extends State<Tayyorlash> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TayyorlashProvider>().reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TayyorlashProvider>();

    List qadamlarList = [];
    if (widget.model?.qadamlar is String) {
      qadamlarList = (widget.model.qadamlar as String)
          .split('\n')
          .where((qadam) => qadam.trim().isNotEmpty)
          .toList();
    } else if (widget.model?.qadamlar is List) {
      qadamlarList = widget.model.qadamlar;
    }

    List qadamlarVaqtiList = [];
    if (widget.model?.qadamlarVaqti is List) {
      qadamlarVaqtiList = widget.model.qadamlarVaqti;
    } else if (widget.model?.qadamlarVaqti is String) {
      qadamlarVaqtiList = (widget.model.qadamlarVaqti as String)
          .split('\n')
          .where((vaqt) => vaqt.trim().isNotEmpty)
          .map((vaqt) => int.tryParse(vaqt.trim()) ?? 0)
          .toList();
    }

    return Scaffold(
      backgroundColor: Cols.dark,
      appBar: const Tayyorlashappbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Tayorqadam(
              currentStep: qadamlarList.isEmpty ? 0 : provider.correctPage + 1,
              totalSteps: qadamlarList.isEmpty ? 1 : qadamlarList.length,
              stepTitle: "JARAYON",
            ),
            const SizedBox(height: 51),
            Expanded(
              child: qadamlarList.isEmpty
                  ? const Center(
                      child: Text(
                        "Qadamlar mavjud emas",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  : PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: provider.pageController,
                      itemCount: qadamlarList.length,
                      onPageChanged: (int index) {
                        provider.onPageChanged(index);
                      },
                      itemBuilder: (context, index) {
                        final int joriyDaqiqa = (qadamlarVaqtiList.length > index)
                            ? (int.tryParse(qadamlarVaqtiList[index].toString()) ?? 10)
                            : 10; 

                        return Taymer(
                          key: ValueKey(index), 
                          model: widget.model,
                          qadamMatni: qadamlarList[index].toString(),
                          daqiqa: joriyDaqiqa, 
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
                      provider.nextPage(
                        qadamlarList.isEmpty ? 1 : qadamlarList.length,
                        context,
                        () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
                      );
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
                      qadamlarList.isEmpty ||
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