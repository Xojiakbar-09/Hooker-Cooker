import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';

class Tayorqadam extends StatelessWidget {
  final int currentStep; // Hozirgi qadam (masalan: 3)
  final int totalSteps; // Jami qadamlar soni (masalan: 6)
  final String stepTitle; // Qadam nomi (masalan: "Zirvakni qaynatish")

  const Tayorqadam({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.stepTitle,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = totalSteps > 0 ? (currentStep / totalSteps) : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Top row: "QADAM 3 / 6" va "Zirvakni qaynatish"
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Cols.orange, 
                  letterSpacing: 0.5,
                ),
                children: [
                  const TextSpan(text: "QADAM "),
                  TextSpan(
                    text: "$currentStep",
                    style: const TextStyle(fontSize: 14),
                  ),
                  const TextSpan(text: "  /  "),
                  TextSpan(
                    text: "$totalSteps",
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),

            Text(
              stepTitle,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        ClipRRect(
          borderRadius: BorderRadius.circular(10), 
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8, 
            backgroundColor: Colors.grey.shade800, 
            valueColor: AlwaysStoppedAnimation<Color>(
              Cols.orange,
            ), // To'lgan qismi rangi
          ),
        ),
      ],
    );
  }
}
