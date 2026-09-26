import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/widget/audioslider.dart';

class Taymer extends StatelessWidget {
  final String qadamMatni;
  final dynamic model;

  const Taymer({super.key, required this.qadamMatni, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Cols.orange.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Cols.orange.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.music_note, color: Cols.orange, size: 16),
              const SizedBox(width: 8),

              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return model.audio == ''
                          ? AlertDialog(
                            backgroundColor: Cols.dark,
                              title: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                                child: const Text(
                                  "Audio qo'llanmasi mavjud emas",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : AudioDialogWidget(audioUrl: model.audio);
                    },
                  );
                },
                child: Text(
                  'JARAYON AUDIOSI',
                  style: TextStyle(
                    color: Cols.orange,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        Text(
          qadamMatni,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Cols.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}
