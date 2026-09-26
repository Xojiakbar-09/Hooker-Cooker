import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooker_cooker/widget/sanekebar.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  void toggleObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleDark(bool value) {
    _isDark = value;
    GetStorage().write('isDark', value);
    notifyListeners();
  }

  bool _isBell = false;
  bool get isBell => _isBell;

  void toggleBell(bool value) {
    _isBell = value;
    GetStorage().write('isBell', value);
    notifyListeners();
  }

  void initStorage() {
    _isDark = GetStorage().read('isDark') ?? false;
    _isBell = GetStorage().read('isBell') ?? false;
    notifyListeners();
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email manzilini kiriting';
    }
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value.trim())) {
      return 'Notoʻgʻri email formati';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Parolni kiriting';
    }
    if (value.length < 8) {
      return 'Parol kamida 8 ta belgidan iborat boʻlishi kerak';
    }
    return null;
  }

  void login(BuildContext context, VoidCallback onSuccess) {
    if (formKey.currentState?.validate() ?? false) {
      GetStorage().write('kirish', true);
      GetStorage().write('user_email', emailController.text.trim());

      onSuccess();
    }
    else {
      final email = emailController.text.trim();
      final password = passwordController.text;

      if (email.isEmpty || password.isEmpty) {
        showErrorTopSnackBar(
          context,
          "Iltimos, barcha maydonlarni to'ldiring!",
        );
      } else if (!RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      ).hasMatch(email)) {
        showErrorTopSnackBar(context, "Email formati noto'g'ri!");
      } else if (password.length < 8) {
        showErrorTopSnackBar(
          context,
          "Parol kamida 8 ta belgidan iborat bo'lishi kerak!",
        );
      } else {
        showErrorTopSnackBar(context, "Ma'lumotlar noto'g'ri kiritildi!");
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> requestAppPermissions() async {
    var cameraStatus = await Permission.camera.status;
    if (!cameraStatus.isGranted) {
      await Permission.camera.request();
    }

    var photosStatus = await Permission.photos.status;
    if (!photosStatus.isGranted) {
      await Permission.photos.request();
    }

    var storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) {
      await Permission.storage.request();
    }
  }
}
