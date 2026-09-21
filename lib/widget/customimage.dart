import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';

class CustomImage extends StatelessWidget {
  final VoidCallback? onImageSelected;

  const CustomImage({super.key, this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        color: Cols.primery,
        strokeWidth: 1.5,
        dashPattern:  [6, 6],
        radius:  Radius.circular(20), 
      ),
      child: Container(
        width: double.infinity,
        padding:  EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          color:  Color(0xFFF9F9FB),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding:  EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 12,
                    offset:  Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.camera_alt_rounded,
                color: Cols.primery,
                size: 26,
              ),
            ),
             SizedBox(height: 16),
             Text(
              'Taom fotosuratini yuklang',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
             SizedBox(height: 4),
             Text(
              'JPG yoki HEIC • Yuqori sifatli rasm',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
             SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: onImageSelected ?? () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color(0xFFFFEBE5),
                foregroundColor: Cols.primery,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              icon:  Icon(Icons.add, size: 18),
              label:  Text(
                'Rasm tanlash',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}