import 'dart:io';
import 'package:flutter/material.dart';

Widget buildRetseptImage(String imagePath) {
  final file = File(imagePath);

  if (imagePath.isNotEmpty && file.existsSync()) {
    return Image.file(
      file,
      width: double.infinity,
      height: 200,
      fit: BoxFit.cover,
    );
  } else {
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