import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/screen/homepage.dart';

class Customelevent extends StatelessWidget {
  final VoidCallback push;
  final String text;
  final Icon icon;
  const Customelevent({
    super.key,
    required this.text,
    required this.icon,
    required this.push,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          push();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Cols.primery,
          foregroundColor: Colors.white,
          elevation: 8,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 8),
            icon,
          ],
        ),
      ),
    );
  }
}
