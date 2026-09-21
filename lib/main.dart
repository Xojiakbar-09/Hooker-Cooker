import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/theme/theme.dart';
import 'package:hooker_cooker/screen/login.dart';
import 'package:hooker_cooker/screen/mainscrren.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hooker cooker',
      theme: Apptheme.light,
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
