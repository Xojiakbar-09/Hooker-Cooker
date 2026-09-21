import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/widget/aylanataymer.dart';

class Taymer extends StatelessWidget {
  final VoidCallback tugaganda;
  final String qadamMatni;

  const Taymer({
    super.key,
    required this.qadamMatni,
    required this.tugaganda,
  });

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
              Icon(Icons.tune_rounded, color: Cols.orange, size: 16),
              const SizedBox(width: 8),
              Text(
                'JARAYON',
                style: TextStyle(
                  color: Cols.orange,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 46),
          child: Aylanataymer(
            onTimerComplete: () {
              tugaganda;
            },
            initialMinutes: 15,
           
          ),
        ),
      ],
    );
  }
}
