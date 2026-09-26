import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooker_cooker/model/db_helper.dart'; 
import 'package:hooker_cooker/model/ingredient.dart';
import 'package:hooker_cooker/model/retseptmodel.dart';
import 'package:image_picker/image_picker.dart';

class RetseptProvider extends ChangeNotifier {
  RetseptProvider() {
    fetchRetseptlar(); 
  }

  List<RetseptModel> _retseptlar = [];
  List<RetseptModel> get retseptlar => _retseptlar;

  final List<Ingredient> _ingredients = [];
  List<Ingredient> get ingredients => _ingredients;

  final List<String> _steps = [];
  List<String> get steps => _steps;

  final TextEditingController retseptNomiController = TextEditingController();
  final TextEditingController masalliqNomiController = TextEditingController();
  final TextEditingController masalliqMiqdoriController =
      TextEditingController();
  final TextEditingController vaqtiController = TextEditingController();
  final TextEditingController stepController = TextEditingController();

  int _porsiya = 1;
  int get porsiya => _porsiya;

  File? _selectedImage;
  File? get selectedImage => _selectedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> fetchRetseptlar() async {
    try {
      _retseptlar = await DatabaseHelper.instance.getSavedRecipes();
      notifyListeners();
    } catch (e) {
      debugPrint("Bazadan o'qishda xatolik: $e");
    }
  }

  void clearForm() {
    _ingredients.clear();
    _steps.clear();
    _selectedImage = null;
    retseptNomiController.clear();
    masalliqNomiController.clear();
    masalliqMiqdoriController.clear();
    vaqtiController.clear();
    stepController.clear();
    _porsiya = 1;
    notifyListeners();
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );

      if (image != null) {
        _selectedImage = File(image.path);
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Rasm tanlashda xatolik: $e");
    }
  }

  void removeImage() {
    _selectedImage = null;
    notifyListeners();
  }

  void masalliqQoshish() {
    final name = masalliqNomiController.text.trim();
    final amount = masalliqMiqdoriController.text.trim();

    if (name.isNotEmpty && amount.isNotEmpty) {
      _ingredients.add(Ingredient(name: name, amount: amount));
      masalliqNomiController.clear();
      masalliqMiqdoriController.clear();
      notifyListeners();
    }
  }

  void masalliqOchirish(int index) {
    if (index >= 0 && index < _ingredients.length) {
      _ingredients.removeAt(index);
      notifyListeners();
    }
  }

  void stepQoshish(String newStep) {
    final stepText = stepController.text.trim();
    if (stepText.isNotEmpty) {
      _steps.add(stepText);
      stepController.clear();
      notifyListeners();
    }
  }

  void stepOchirish(int index) {
    if (index >= 0 && index < _steps.length) {
      _steps.removeAt(index);
      notifyListeners();
    }
  }

  void porsiyaQoShish() {
    _porsiya++;
    notifyListeners();
  }

  void porsiyaKamaytirish() {
    if (_porsiya > 1) {
      _porsiya--;
      notifyListeners();
    }
  }

  Future<String?> retseptniSqflitegaSaqlash() async {
    try {
      final nomi = retseptNomiController.text.trim();

      if (nomi.isEmpty) {
        return "Iltimos, retsept nomini kiriting!";
      }

      if (_ingredients.isEmpty) {
        return "Iltimos, kamida bitta masalliq qo'shing!";
      }

      final newRecipe = RetseptModel(
        sersa: false,
        imagePath: _selectedImage?.path ?? '',
        nomi: nomi,
        portsiya: "$_porsiya kishilik",
        vaqt: vaqtiController.text.trim(),
        masalliqlar: List.from(_ingredients),
        qadamlar: List.from(_steps),
         audio: '',
      );

      await DatabaseHelper.instance.insertRecipe(newRecipe);
      await fetchRetseptlar();
      clearForm();

      return null;
    } catch (e) {
      debugPrint("Saqlashda xatolik yuz berdi: $e");
      return "Saqlashda xatolik yuz berdi: $e";
    }
  }

  @override
  void dispose() {
    retseptNomiController.dispose();
    masalliqNomiController.dispose();
    masalliqMiqdoriController.dispose();
    vaqtiController.dispose();
    stepController.dispose();
    super.dispose();
  }
}
