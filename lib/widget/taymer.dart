import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/widget/aylanataymer.dart'; 
import 'package:hooker_cooker/widget/audioslider.dart';

class Taymer extends StatelessWidget {
  final int daqiqa;
  final String qadamMatni;
  final dynamic model;

  const Taymer({
    super.key,
    required this.qadamMatni,
    required this.model,
    required this.daqiqa,
  });

  int _parseMinutes(dynamic model) {
    if (model == null) return 5;

    dynamic vaqtValue;

    try {
      vaqtValue = model.vaqt;
    } catch (_) {
      try {
        vaqtValue = model.vaqti;
      } catch (_) {
        try {
          vaqtValue = model.pishirishVaqti;
        } catch (_) {
          vaqtValue = null;
        }
      }
    }

    if (vaqtValue == null) return 5;

    if (vaqtValue is int) return vaqtValue;

    final String numbersOnly = vaqtValue.toString().replaceAll(
      RegExp(r'[^0-9]'),
      '',
    );
    return int.tryParse(numbersOnly) ?? 5;
  }

  // Model ichidan audioni xavfsiz olish
  String? _getAudioUrl(dynamic model) {
    if (model == null) return null;
    try {
      return model.audio;
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final int timerMinutes = daqiqa > 0 ? daqiqa : _parseMinutes(model);
    final String? audioUrl = _getAudioUrl(model);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
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
                        return (audioUrl == null || audioUrl.isEmpty)
                            ? AlertDialog(
                                backgroundColor: Cols.dark,
                                title: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 15,
                                  ),
                                  child: Text(
                                    "Audio qo'llanmasi mavjud emas",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            : AudioDialogWidget(audioUrl: audioUrl);
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
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 30),

          Aylanataymer(
            initialMinutes: timerMinutes,
            onTimerComplete: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Vaqt tugadi!"),
                  backgroundColor: Colors.green,
                ),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
