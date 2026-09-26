import 'package:flutter/material.dart';
import 'package:hooker_cooker/screen/login.dart';
import 'package:hooker_cooker/widget/intro_animation.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroAnimation(
      nextPage: Login(),
    );
  }
}