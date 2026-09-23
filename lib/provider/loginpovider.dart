import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginProvider extends ChangeNotifier {
  // Kontrollerlar va Form Key
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Parolni yashirish/ko'rsatish holati
  bool _isObscure = true;
  bool get isObscure => _isObscure;

  void toggleObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  // Tezkis sozlamalar holatlari
  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleDark(bool value) {
    _isDark = value;
    notifyListeners();
  }

  bool _isBell = false;
  bool get isBell => _isBell;

  void toggleBell(bool value) {
    _isBell = value;
    notifyListeners();
  }

  // Sahifa ochilganda GetStorage'ga yozish
  void initStorage() {
    GetStorage().write('kirish', true);
  }

  // Email validatsiyasi
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

  // Parol validatsiyasi
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Parolni kiriting';
    }
    if (value.length < 8) {
      return 'Parol kamida 8 ta belgidan iborat boʻlishi kerak';
    }
    return null;
  }

  // Tizimga kirish tugmasi bosilganda
  void login(BuildContext context, VoidCallback onSuccess) {
    if (formKey.currentState?.validate() ?? false) {
      onSuccess(); // Muvaffaqiyatli bo'lsa ekranni almashtirish uchun callback
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}