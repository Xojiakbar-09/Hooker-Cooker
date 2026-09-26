import 'dart:io';
import 'package:flutter/material.dart';

Widget buildRetseptImage(String imagePath) {
  final file = File(imagePath);

  // Fayl mavjud va yo'li bo'sh emasligini tekshiramiz
  if (imagePath.isNotEmpty && file.existsSync()) {
    return Image.file(
      file,
      width: double.infinity,
      height: 200,
      fit: BoxFit.cover,
    );
  } else {
    // Rasm topilmasa yoki yo'q bo'lsa zaxira (placeholder) ko'rsatamiz
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.grey.shade300,
      child: const Icon(
        Icons.image_not_supported,
        size: 50,
        color: Colors.grey,
      ),
    );
  }
}