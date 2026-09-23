import 'package:flutter/material.dart';
import 'package:hooker_cooker/model/db_helper.dart';
import 'package:hooker_cooker/model/ingredient.dart';

class RetseptProvider extends ChangeNotifier {
  List<Ingredient> _ingredients = [];
  List<Ingredient> get ingredients => _ingredients;

  // Controller'lar
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController vaqtiController = TextEditingController();

  // Porsiya holati (boshlang'ich qiymati 1)
  int _porsiya = 1;
  int get porsiya => _porsiya;

  // Bazadan masalliqlarni yuklab olish
  Future<void> fetchIngredients() async {
    _ingredients = await DatabaseHelper.instance.getAllIngredients();
    notifyListeners();
  }

  // Masalliq qo'shish
  Future<void> masalliqQoshish() async {
    final name = nameController.text.trim();
    final amount = amountController.text.trim();

    if (name.isNotEmpty && amount.isNotEmpty) {
      final newIngredient = Ingredient(name: name, amount: amount);

      await DatabaseHelper.instance.insertIngredient(newIngredient);

      nameController.clear();
      amountController.clear();
      await fetchIngredients();
    }
  }

  // Masalliqni o'chirish
  Future<void> masalliqOchirish(int id) async {
    await DatabaseHelper.instance.deleteIngredient(id);
    await fetchIngredients();
  }

  // Porsiyani oshirish
  void porsiyaQoShish() {
    _porsiya++;
    notifyListeners();
  }

  // Porsiyani kamaytirish (1 dan kamayib ketmasligi uchun tekshiruv bilan)
  void porsiyaKamaytirish() {
    if (_porsiya > 1) {
      _porsiya--;
      notifyListeners();
    }
  }

  // Retsept va masalliqlarni SQFlite'ga saqlash
  Future<bool> retseptniSqflitegaSaqlash() async {
    try {
      // Bu yerda retsept ma'lumotlarini saqlash mantig'i bo'ladi
      if (_ingredients.isNotEmpty) {
        // Saqlash muvaffaqiyatli bo'lsa
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    vaqtiController.dispose();
    super.dispose();
  }
}
